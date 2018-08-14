library plato.archives.components.patron;

import 'dart:async' show Future;

import 'package:angular/angular.dart';

import '../../user/authentication/authentication_component.dart';
import '../../user/authentication/authentication_service.dart';
import '../../user/session/session_service.dart';
import '../../user/session/session_user.dart';
import '../../user/users_service.dart';

import '../progress/progress_service.dart';

import '../workflow/workflow_service.dart';

/// The [PatronComponent] class...
@Component(
  selector: 'patron',
  templateUrl: 'patron_component.html',
  directives: [AuthenticationComponent, NgIf],
  providers: [
    AuthenticationService, SessionService, UsersService, WorkflowService
  ]
)
class PatronComponent implements OnInit {
  SessionUser _patron;

  SessionUser get patron => _patron;

  bool _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated;

  bool _isLtiSession;

  final AuthenticationService _authenticationService;

  final ProgressService _progressService;

  final SessionService _sessionService;

  final UsersService _usersService;

  final WorkflowService _workflowService;

  /// The [PatronComponent] constructor...
  PatronComponent (
    this._authenticationService, this._progressService,
    this._sessionService, this._usersService, this._workflowService
  ) {
    _isAuthenticated = false;
    _isLtiSession = false;
  }

  /// The [ngOnInit] method...
  @override
  Future<void> ngOnInit() async {
    if (_isAuthenticated) {
      return;
    }

    _progressService.invoke ('Determining if a current session exists.');

    try {
      if (await _sessionService.checkIfSessionExists()) {
        _isAuthenticated = true;
        _isLtiSession = _sessionService.isLtiSession;

        await retrievePatronInfo();
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
          await retrievePatronInfo();
        };
      }
    );
  }

  /// The [retrievePatronInfo] method...
  Future<void> retrievePatronInfo() async {
    if (isAuthenticated && (null == patron)) {
      _progressService.invoke ('Retrieving the user information.');

      try {
        _patron =
          await _usersService.retrieveUser (isLtiSession: _isLtiSession);

        _workflowService.markPatronEstablished();
      } catch (_) {}

      _progressService.revoke();
    }
  }
}
