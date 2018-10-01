library plato.archives.services.resources;

import 'dart:async' show Future;

/// The [ResourcesService] class...
class ResourcesService {
  static ResourcesService _instance;

  /// The [ResourcesService] factory constructor;
  factory ResourcesService() =>
    _instance ?? (_instance = new ResourcesService._());

  /// The [ResourcesService] private constructor...
  ResourcesService._ ();

  /// The [loadResourcesTypes] method...
  Future<void> loadResourcesTypes (String archiveId) async {
    ;
  }

  /// The [loadResourcesByType] method...
  Future<void> loadResourcesByType (String archiveId, String type) async {
    ;
  }

  /// The [loadResource] method...
  Future<void> loadResource (String archiveId, String resourceId) async {
    ;
  }
}
