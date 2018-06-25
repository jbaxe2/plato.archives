library plato.archives.factory.resources;

import '../_application/factory/plato_factory.dart';

import 'resource.dart';

/// The [ResourcesFactory] class...
class ResourcesFactory implements PlatoFactory<Resource> {
  /// The [ResourcesFactory] constructor...
  ResourcesFactory();

  /// The [create] method...
  @override
  Resource create (Map<String, dynamic> rawResource, [String type]) {
    Resource resource;

    try {
      resource = _createResource (
        rawResource['id'], rawResource['title'], type, rawResource['extra']
      );
    } catch (_) {
      ;
    }

    return resource;
  }

  /// The [createAll] method...
  @override
  Iterable<Resource> createAll (
    Iterable<Map<String, dynamic>> rawResources, [String type]
  ) {
    var resources = new List<Resource>();

    return resources;
  }

  /// The [_createResource] method...
  Resource _createResource (
    String id, String title, String type, [dynamic extra]
  ) {
    Resource resource;

    ; // Do stuff here to create the resource.

    return resource;
  }
}
