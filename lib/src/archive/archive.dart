library plato.archives.models.archive;

import '../resource/resource.dart';

/// The [Archive] class...
class Archive {
  final String id;

  final String title;

  final Map<String, Resource> resources;

  /// The [Archive] constructor...
  Archive (this.id, this.title, this.resources);
}
