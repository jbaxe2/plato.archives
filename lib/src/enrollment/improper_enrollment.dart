library plato.archives.error.enrollment.improper;

import '../_application/error/plato_exception.dart';

/// The [ImproperEnrollment] class...
class ImproperEnrollment extends PlatoException {
  /// The [ImproperEnrollment] constructor...
  ImproperEnrollment (
    [String message = 'An unknown improper enrollment error has occurred.']
  ) : super (message);
}
