library plato.archives.error.authorization;

import '../../_application/error/plato_exception.dart';

/// The [AuthorizationError] class...
class AuthorizationError extends PlatoException {
  /// The [AuthorizationError] constructor...
  AuthorizationError (
    [String message = 'An unknown authorization error has occurred.']
  ) : super (message);
}
