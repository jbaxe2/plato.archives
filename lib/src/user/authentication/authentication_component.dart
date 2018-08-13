library plato.archives.components.user.authentication;

import 'dart:async' show Future;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../_application/progress/progress_service.dart';

import 'authentication_service.dart';

/// The [AuthenticationComponent] class...
@Component(
  selector: 'authentication',
  templateUrl: 'authentication_component.html',
  directives: [
    materialInputDirectives,
    MaterialButtonComponent, MaterialIconComponent, MaterialInputComponent,
    NgModel
  ],
  providers: [AuthenticationService, ProgressService]
)
class AuthenticationComponent {
  String username;

  String password;

  bool get isAuthenticated => _authenticationService.isAuthenticated;

  final AuthenticationService _authenticationService;

  final ProgressService _progressService;

  /// The [AuthenticationComponent] constructor...
  AuthenticationComponent (this._authenticationService, this._progressService);

  /// The [authenticate] method...
  Future<void> authenticate() async {
    if (username.isEmpty || password.isEmpty) {
      return;
    }

    try {
      _progressService.invoke ('Attempting to verify Plato credentials.');
      await _authenticationService.authenticate (username, password);

      isAuthenticated;
    } catch (_) {}

    _progressService.revoke();
  }
}
