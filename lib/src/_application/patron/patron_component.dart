library plato.archives.components.patron;

import 'dart:async' show Future;

import 'package:angular/angular.dart';

import '../../user/authentication/authentication_component.dart';
import '../../user/authentication/authentication_service.dart';
import '../../user/session/session_service.dart';
import '../../user/session/session_user.dart';
import '../../user/users_service.dart';

import '../caching/caching_service.dart';

import '../progress/progress_service.dart';

import '../workflow/workflow_service.dart';

/// The [PatronComponent] class...
@Component(
  selector: 'patron',
  templateUrl: 'patron_component.html',
  directives: [AuthenticationComponent, NgIf],
  providers: [
    AuthenticationService, CachingService, ProgressService, SessionService,
    UsersService, WorkflowService
  ]
)
class PatronComponent implements AfterViewInit {
  SessionUser _patron;

  SessionUser get patron => _patron;

  bool _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated;

  bool _isLtiSession;

  final AuthenticationService _authenticationService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  final SessionService _sessionService;

  final UsersService _usersService;

  final WorkflowService _workflowService;

  /// The [PatronComponent] constructor...
  PatronComponent (
    this._authenticationService, this._cachingService, this._progressService,
    this._sessionService, this._usersService, this._workflowService
  ) {
    _isAuthenticated = false;
    _isLtiSession = false;
  }

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    if (_loadFromCache()) {
      return;
    }

    await _checkIfSessionExists();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    if (!_cachingService.haveCachedObject ('patron')) {
      return false;
    }

    _patron = _cachingService.retrieveCachedObject ('patron') as SessionUser;
    _isAuthenticated = true;
    _isLtiSession = _sessionService.isLtiSession;

    _workflowService.markPatronEstablished();

    return true;
  }

  /// The [_checkIfSessionExists] method...
  Future<void> _checkIfSessionExists() async {
    _progressService.invoke ('Determining if a current session exists.');

    try {
      if (await _sessionService.checkIfSessionExists()) {
        _isAuthenticated = true;
        _isLtiSession = _sessionService.isLtiSession;

        await _retrievePatronInfo();
      } else {
        await _listenForAuthentication();
      }
    } catch (_) {}

    _progressService.revoke();
  }

  /// The [_listenForAuthentication] method...
  Future<void> _listenForAuthentication() async {
    _authenticationService.authenticationStream.listen (
      (bool authenticationResult) async {
        if (_isAuthenticated = authenticationResult) {
          await _retrievePatronInfo();
        };
      }
    );
  }

  /// The [_retrievePatronInfo] method...
  Future<void> _retrievePatronInfo() async {
    if (isAuthenticated && (null == patron)) {
      _progressService.invoke ('Retrieving the user information.');

      try {
        _patron =
          await _usersService.retrieveUser (isLtiSession: _isLtiSession);

        _cachingService.cacheObject ('patron', _patron);
        _workflowService.markPatronEstablished();
      } catch (_) {}

      _progressService.revoke();
    }
  }
}
