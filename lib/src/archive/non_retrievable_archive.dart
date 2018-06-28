library plato.archives.error.retrieve_archives;

import '../_application/error/plato_exception.dart';

class NonRetrievableArchive extends PlatoException {
  NonRetrievableArchive (
    [String message = 'A non-retrievable archive error has occurred.']
  ) : super (message);
}
