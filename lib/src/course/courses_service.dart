library plato.archives.services.courses;

import 'dart:async' show Future;

/// The [CoursesService] class...
class CoursesService {
  static CoursesService _instance;

  /// The [CoursesService] factory constructor...
  factory CoursesService() => _instance ?? (_instance = new CoursesService._());

  /// The [CoursesService] private constructor...
  CoursesService._();

  /// The [loadArchivedCourse] method...
  Future<void> loadArchivedCourse (String archiveId) async {
    ;
  }
}
