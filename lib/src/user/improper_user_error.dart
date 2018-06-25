library plato.archives.error.user.improper;

import '../_application/error/plato_exception.dart';

/// The [ImproperUserError] class...
class ImproperUserError extends PlatoException {
  /// The [ImproperUserError] constructor...
  ImproperUserError (
    [String message = 'An unknown improper user error has occurred.']
  ) : super (message);
}
