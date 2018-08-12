library plato.crf.factory.enrollment;

import '../_application/factory/plato_factory.dart';

import 'archive_enrollment.dart';
import 'faculty_enrollment.dart';
import 'enrollment.dart';
import 'improper_enrollment.dart';

/// The [EnrollmentFactory] class...
class EnrollmentFactory implements PlatoFactory<Enrollment> {
  /// The [EnrollmentFactory] default constructor...
  EnrollmentFactory();

  /// The [create] method...
  @override
  Enrollment create (
    covariant Map<String, Object> rawEnrollment,
    [String type = '', bool fromArchive = false]
  ) {
    if (!(rawEnrollment.containsKey ('banner.user.cwid') &&
          rawEnrollment.containsKey ('learn.user.username') &&
          rawEnrollment.containsKey ('learn.course.id') &&
          rawEnrollment.containsKey ('learn.course.name') &&
          rawEnrollment.containsKey ('learn.membership.role') &&
          rawEnrollment.containsKey ('learn.membership.available'))) {
      throw new ImproperEnrollment (
        'The provided enrollment was not formatted correctly.'
      );
    }

    Enrollment enrollment;

    try {
      switch (type) {
        case 'archive':
          enrollment = _createArchiveEnrollment (rawEnrollment);
          break;
        case 'faculty':
          enrollment = _createFacultyEnrollment (rawEnrollment);
          break;
        default:
          enrollment = _createRegularEnrollment (rawEnrollment, fromArchive);
          break;
      }
    } catch (_) {
      rethrow;
    }

    return enrollment;
  }

  /// The [createAll] method...
  @override
  List<Enrollment> createAll (
    covariant Iterable<Map<String, Object>> rawEnrollments,
    [String type = '', bool fromArchives = false]
  ) {
    var enrollments = new List<Enrollment>();

    try {
      rawEnrollments.forEach ((Map<String, dynamic> rawEnrollment) {
        enrollments.add (create (rawEnrollment, type, fromArchives));
      });
    } catch (_) {
      rethrow;
    }

    return enrollments;
  }

  Enrollment _createRegularEnrollment (
    covariant Map<String, Object> rawEnrollment, [bool fromArchive = false]
  ) {
    return new Enrollment (
      ('${rawEnrollment['learn.course.id']}_${rawEnrollment['banner.user.cwid']}'),
      rawEnrollment['learn.course.id'], rawEnrollment['learn.course.name'],
      rawEnrollment['banner.user.cwid'], rawEnrollment['learn.membership.role'],
      rawEnrollment['learn.membership.available'], forArchive: fromArchive
    );
  }

  /// The [_createArchiveEnrollment] method...
  ArchiveEnrollment _createArchiveEnrollment (
    covariant Map<String, Object> rawEnrollment
  ) {
    return new ArchiveEnrollment (
      ('${rawEnrollment['learn.course.id']}_${rawEnrollment['banner.user.cwid']}'),
      rawEnrollment['learn.course.id'], rawEnrollment['learn.course.name'],
      rawEnrollment['banner.user.cwid'], rawEnrollment['learn.membership.role'],
      rawEnrollment['learn.membership.available']
    );
  }

  /// The [_createFacultyEnrollment] method...
  FacultyEnrollment _createFacultyEnrollment (
    covariant Map<String, Object> rawEnrollment
  ) {
    String role = (rawEnrollment['learn.membership.role'] as String);

    if ('instructor' != role.toLowerCase()) {
      throw new ImproperEnrollment (
        'Attempted to create a faculty enrollment without an instructor role.'
      );
    }

    return new FacultyEnrollment (
      ('${rawEnrollment['learn.course.id']}_${rawEnrollment['banner.user.cwid']}'),
      rawEnrollment['learn.course.id'], rawEnrollment['learn.course.name'],
      rawEnrollment['banner.user.cwid'], rawEnrollment['learn.membership.available']
    );
  }
}
