library plato.archives.models.course;

import '../resource/resource.dart';

/// The [Course] class...
class Course {
  final String id;

  final String title;

  final Map<String, Resource> resources;

  /// The [Course] constructor...
  Course (this.id, this.title, this.resources);
}
