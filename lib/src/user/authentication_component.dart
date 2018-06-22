library plato.archives.components.user.authentication;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'authenticated_user.dart';
import 'authentication_service.dart';

/// The [AuthenticationComponent] class...
@Component(
  selector: 'authentication',
  templateUrl: 'authentication_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: [AuthenticationService]
)
class AuthenticationComponent {
  AuthenticatedUser authenticatedUser;

  final AuthenticationService _authenticationService;

  /// The [AuthenticationComponent] constructor...
  AuthenticationComponent (this._authenticationService);
}
