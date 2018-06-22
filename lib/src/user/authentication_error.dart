library plato.archives.error.authentication;

import '../_application/error/plato_exception.dart';

/// The [AuthenticationError] class...
class AuthenticationError extends PlatoException {
  /// The [AuthenticationError] constructor...
  AuthenticationError (
    [String message = 'An unknown authentication error has occurred.']
  ) : super (message);
}
