library plato.archives.components.patron;

import 'dart:async' show Future;

import 'package:angular/angular.dart';

import '../../user/authorization/authorization_component.dart';
import '../../user/authorization/authorization_service.dart';
import '../../user/session/session_service.dart';
import '../../user/session/session_user.dart';
import '../../user/improper_user.dart';
import '../../user/users_service.dart';

import '../caching/caching_service.dart';

import '../progress/progress_service.dart';

import '../workflow/workflow_service.dart';

/// The [PatronComponent] class...
@Component(
  selector: 'patron',
  templateUrl: 'patron_component.html',
  directives: [AuthorizationComponent, NgIf],
  providers: [
    AuthorizationService, CachingService, ProgressService, SessionService,
    UsersService, WorkflowService
  ]
)
class PatronComponent implements OnInit {
  SessionUser _patron;

  SessionUser get patron => _patron;

  bool _isAuthorized;

  bool get isAuthorized => _isAuthorized;

  bool _isLtiSession;

  final AuthorizationService _authorizationService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  final SessionService _sessionService;

  final UsersService _usersService;

  final WorkflowService _workflowService;

  /// The [PatronComponent] constructor...
  PatronComponent (
    this._authorizationService, this._cachingService, this._progressService,
    this._sessionService, this._usersService, this._workflowService
  ) {
    _isAuthorized = false;
    _isLtiSession = false;
  }

  /// The [ngOnInit] method...
  @override
  Future<void> ngOnInit() async {
    if (_loadFromCache()) {
      return;
    }

    await _listenForAuthorization();
    await _checkIfSessionExists();

    await _authorizationService.authorizeUser();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    if (!_cachingService.haveCachedObject ('patron')) {
      return false;
    }

    _patron = _cachingService.retrieveCachedObject ('patron') as SessionUser;
    _isAuthorized = true;
    _isLtiSession = _sessionService.isLtiSession;

    _workflowService.markPatronEstablished();

    return true;
  }

  /// The [_listenForAuthorization] method...
  Future<void> _listenForAuthorization() async {
    _authorizationService.authorizationStream.listen (
      (bool authorizationResult) async {
        if ((_isAuthorized = authorizationResult) && (null == _patron)) {
          await _retrievePatronInfo();
        }
      }
    );
  }

  /// The [_checkIfSessionExists] method...
  Future<void> _checkIfSessionExists() async {
    _progressService.invoke ('Determining if a current session exists.');

    try {
      if (await _sessionService.checkIfSessionExists()) {
        _isAuthorized = true;
        _isLtiSession = _sessionService.isLtiSession;

        await _retrievePatronInfo();

        _workflowService.establishNextStep();
      }
    } catch (_) {}

    _progressService.revoke();
  }

  /// The [_retrievePatronInfo] method...
  Future<void> _retrievePatronInfo() async {
    if (null == patron) {
      _progressService.invoke ('Retrieving the user information.');

      if (!isAuthorized) {
        try {
          if (!(await _authorizationService.authorizeUser())) {
            throw new ImproperUser ('The user could not be authorized correctly.');
          }
        } catch (_) {}
      }

      try {
        _patron = await _usersService.retrieveUser (isLtiSession: _isLtiSession);

        _cachingService.cacheObject ('patron', _patron);
        _workflowService.markPatronEstablished();
      } catch (_) {}

      _progressService.revoke();
    }
  }
}
