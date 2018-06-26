library plato.archives.models.enrollment.archive;

import 'enrollment.dart';

/// The [ArchiveEnrollment] class...
class ArchiveEnrollment extends Enrollment {
  /// The [ArchiveEnrollment] constructor...
  ArchiveEnrollment (
    String id, String courseId, String courseName, String userId, String role,
    bool available
  ) : super (id, courseId, courseName, userId, role, available, forArchive: true);
}
