library plato.archives.errors.improper.part;

import '../../_application/error/plato_exception.dart';

/// The [ImproperArchivePart] class...
class ImproperArchivePart extends PlatoException {
  /// The [ImproperArchivePart] constructor...
  ImproperArchivePart (
    [String message = 'The archive part was improper.']
  ) : super (message);
}
