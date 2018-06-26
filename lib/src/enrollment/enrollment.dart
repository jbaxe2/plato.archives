library plato.archives.models.enrollment;

/// The [Enrollment] class...
class Enrollment {
  final String id;

  final String courseId;

  final String courseName;

  final String userId;

  final String role;

  final bool available;

  final bool forArchive;

  /// The [Enrollment] constructor...
  Enrollment (
    this.id, this.courseId, this.courseName, this.userId, this.role,
    this.available, {this.forArchive = true}
  );
}
