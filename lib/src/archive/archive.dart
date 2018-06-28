library plato.archives.models.archive;

import '../course/course.dart';

import '../resource/resource.dart';

/// The [Archive] class...
class Archive extends Course {
  final Map<String, Resource> resources;

  /// The [Archive] constructor...
  Archive (String id, String title, this.resources) : super (id, title);
}
