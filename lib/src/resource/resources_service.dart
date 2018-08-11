library plato.archives.services.resources;

import 'dart:async' show Future;

import 'package:angular/core.dart' show Injectable;

/// The [ResourcesService] class...
@Injectable()
class ResourcesService {
  /// The [ResourcesService] constructor...
  ResourcesService();

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
