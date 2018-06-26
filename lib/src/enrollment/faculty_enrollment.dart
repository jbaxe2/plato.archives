library plato.archives.models.enrollment.faculty;

import 'archive_enrollment.dart';

/// The [FacultyEnrollment] class...
class FacultyEnrollment extends ArchiveEnrollment {
  /// The [FacultyEnrollment] constructor...
  FacultyEnrollment (
    String id, String courseId, String courseName, String userId,
    bool available, {bool forArchive = true}
  ) : super (
    id, courseId, courseName, userId, 'Instructor', available
  );
}
