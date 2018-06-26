library plato.archives.models.enrollment.faculty;

import 'enrollment.dart';

/// The [FacultyEnrollment] class...
class FacultyEnrollment extends Enrollment {
  /// The [FacultyEnrollment] constructor...
  FacultyEnrollment (
    String id, String courseId, String courseName, String userId,
    bool available, {bool forArchive = true}
  ) : super (
    id, courseId, courseName, userId, 'Instructor', available, forArchive: forArchive
  );
}
