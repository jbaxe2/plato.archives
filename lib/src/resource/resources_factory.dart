library plato.archives.factory.resources;

import '../_application/factory/plato_factory.dart';

import 'invalid_resource.dart';
import 'resource.dart';

/// The [ResourcesFactory] class...
class ResourcesFactory implements PlatoFactory<Resource> {
  /// The [ResourcesFactory] constructor...
  ResourcesFactory();

  /// The [create] method...
  @override
  Resource create (Map<String, String> rawResource, [String type]) {
    Resource resource;

    if (rawResource.containsKey ('courseId')) {
      rawResource['id'] = rawResource['courseId'];
    }

    if (rawResource.containsKey ('courseTitle')) {
      rawResource['title'] = rawResource['courseTitle'];
    }

    try {
      if (rawResource.containsKey ('resource')) {
        resource = _createResource (
          rawResource['id'], rawResource['title'], type,
          rawResource['resource']
        );
      } else {
        resource = _createResource (
          rawResource['id'], rawResource['title'], type
        );
      }
    } catch (_) {
      throw new InvalidResource (
        'The provided information does not pertain to a valid archive resource.'
      );
    }

    return resource;
  }

  /// The [createAll] method...
  @override
  Iterable<Resource> createAll (
    Iterable<Map<String, String>> rawResources, [String type]
  ) {
    var resources = new List<Resource>();

    return resources;
  }

  /// The [createAllByMap] method...
  List<Resource> createAllByMap (Map<String, String> rawResources, [String type]) {
    var resources = new List<Resource>();

    try {
      rawResources.forEach ((String resourceId, String resourceTitle) {
        resources.add (
          create ({'id': resourceId, 'title': resourceTitle}, type)
        );
      });
    } catch (_) {
      rethrow;
    }

    return resources;
  }

  /// The [_createResource] method...
  Resource _createResource (
    String id, String title, String type, [String resource = '']
  ) {
    return new Resource (id, title, type, resource);
  }
}
