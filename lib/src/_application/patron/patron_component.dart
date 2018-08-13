library plato.archives.components.patron;

import 'dart:async' show Future;

import 'package:angular/angular.dart';

import '../../user/authentication/authentication_component.dart';
import '../../user/authentication/authentication_service.dart';
import '../../user/session/session_service.dart';
import '../../user/session/session_user.dart';
import '../../user/users_service.dart';

import '../progress/progress_service.dart';

/// The [PatronComponent] class...
@Component(
  selector: 'patron',
  templateUrl: 'patron_component.html',
  directives: [AuthenticationComponent, NgIf],
  providers: [AuthenticationService, SessionService, UsersService]
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

  /// The [PatronComponent] constructor...
  PatronComponent (
    this._authenticationService, this._progressService,
    this._sessionService, this._usersService
  ) {
    _isAuthenticated = false;
    _isLtiSession = false;
  }

  /// The [ngOnInit] method...
  @override
  Future<void> ngOnInit() async {
    _progressService.invoke ('Determining if a current session exists.');

    try {
      if (await _sessionService.checkIfSessionExists()) {
        _isAuthenticated = true;
        _isLtiSession = _sessionService.isLtiSession;

        await retrievePatronInfo();
      } else {
        _listenForAuthentication();
      }
    } catch (_) {}

    _progressService.revoke();
  }

  /// The [_listenForAuthentication] method...
  void _listenForAuthentication() {
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
      } catch (_) {}

      _progressService.revoke();
    }
  }
}
