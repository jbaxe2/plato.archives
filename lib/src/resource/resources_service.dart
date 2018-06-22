library plato.archives.services.resources;

import 'dart:async' show Future;

import 'package:angular/core.dart';

/// The [ResourcesService] class...
@Injectable()
class ResourcesService {
  static ResourcesService _instance;

  /// The [ResourcesService] factory constructor...
  factory ResourcesService() => _instance ?? (_instance = new ResourcesService._());

  /// The [ResourcesService] private constructor...
  ResourcesService._();

  /// The [loadResourcesByType] method...
  Future<void> loadResourcesByType (String type) async {
    ;
  }

  /// The [loadResource] method...
  Future<void> loadResource (String resourceId) async {
    ;
  }
}
