library plato.archives.models.enrollment;

/// The [Enrollment] class...
class Enrollment {
  final String id;

  final String courseId;

  final String userId;

  final String role;

  /// The [Enrollment] constructor...
  Enrollment (this.id, this.courseId, this.userId, this.role);
}
