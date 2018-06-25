library plato.archives.error.user.improper;

import '../_application/error/plato_exception.dart';

/// The [ImproperUser] class...
class ImproperUser extends PlatoException {
  /// The [ImproperUser] constructor...
  ImproperUser (
    [String message = 'An unknown improper user error has occurred.']
  ) : super (message);
}
