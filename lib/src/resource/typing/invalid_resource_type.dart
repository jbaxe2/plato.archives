library plato.archives.error.invalid.resource_type;

import '../../_application/error/plato_exception.dart';

/// The [InvalidResourceType] class...
class InvalidResourceType extends PlatoException {
  /// The [InvalidResourceType] constructor...
  InvalidResourceType (
    [String message = 'The type provided for the resource is invalid.']
  ) : super (message);
}
