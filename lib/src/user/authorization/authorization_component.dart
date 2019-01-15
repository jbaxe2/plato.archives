library plato.archives.components.user.authorization;

import 'dart:async' show Future;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../_application/progress/progress_service.dart';

import 'authorization_service.dart';

/// The [AuthorizationComponent] class...
@Component(
  selector: 'authorization',
  templateUrl: 'authorization_component.html',
  styleUrls: ['authorization_component.css'],
  directives: [
    materialInputDirectives,
    MaterialButtonComponent, MaterialIconComponent, MaterialInputComponent,
    NgModel
  ],
  providers: [AuthorizationService, ProgressService]
)
class AuthorizationComponent {
  bool get isAuthorized => _authenticationService.isAuthorized;

  final AuthorizationService _authenticationService;

  final ProgressService _progressService;

  /// The [AuthorizationComponent] constructor...
  AuthorizationComponent (this._authenticationService, this._progressService);

  /// The [authorize] method...
  Future<void> authorize() async {
    try {
      _progressService.invoke ('Attempting to verify Plato credentials.');
      await _authenticationService.authorizeApplication();

      isAuthorized;
    } catch (_) {}

    _progressService.revoke();
  }
}
