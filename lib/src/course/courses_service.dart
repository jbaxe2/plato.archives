library plato.archives.services.courses;

import 'dart:async' show Future;

import 'package:angular/core.dart';

/// The [CoursesService] class...
@Injectable()
class CoursesService {
  static CoursesService _instance;

  /// The [CoursesService] factory constructor...
  factory CoursesService() => _instance ?? (_instance = new CoursesService._());

  /// The [CoursesService] private constructor...
  CoursesService._();

  /// The [loadArchivesListForFaculty] method...
  Future<void> loadArchivesListForFaculty (String username) async {
    ;
  }

  /// The [loadArchivedCourse] method...
  Future<void> loadArchivedCourse (String archiveId) async {
    ;
  }
}
