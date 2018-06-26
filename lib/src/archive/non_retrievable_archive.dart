library plato.archives.error.retrieve_archives;

import '../_application/error/plato_exception.dart';

class NonRetrievableArchive extends PlatoException {
  NonRetrievableArchive (
    [String message = 'The list of archives were not retrievable.']
  ) : super (message);
}
