library plato.archives.error.invalid.organization;

import '../_application/error/plato_exception.dart';

/// The [InvalidOrganization] class...
class InvalidOrganization extends PlatoException {
  /// The [InvalidOrganization] constructor...
  InvalidOrganization (
    [String message = 'The provided organization was found to be invalid.']
  ) : super (message);
}
