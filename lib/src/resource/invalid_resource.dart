library plato.archives.error.invalid.resource;

import '../_application/error/plato_exception.dart';

/// The [InvalidResource] class...
class InvalidResource extends PlatoException {
  /// The [InvalidResource] constructor...
  InvalidResource (
    [String message = 'The provided resource ID is invalid.']
  ) : super (message);
}
