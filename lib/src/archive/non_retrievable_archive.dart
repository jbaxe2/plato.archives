library plato.archives.error.retrieve_archives;

import '../_application/error/plato_exception.dart';

/// The [NonRetrievableArchive] class...
class NonRetrievableArchive extends PlatoException {
  /// The [NonRetrievableArchive] constructor...
  NonRetrievableArchive (
    [String message = 'A non-retrievable archive error has occurred.']
  ) : super (message);
}
