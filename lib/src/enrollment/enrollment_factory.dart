library plato.crf.factory.enrollment;

import '../_application/factory/plato_factory.dart';

import 'enrollment.dart';
import 'improper_enrollment.dart';

/// The [EnrollmentFactory] class...
class EnrollmentFactory implements PlatoFactory<Enrollment> {
  /// The [EnrollmentFactory] default constructor...
  EnrollmentFactory();

  /// The [create] method...
  @override
  Enrollment create (
    Map<String, dynamic> rawEnrollment, [String type = '', bool fromArchive = false]
  ) {
    if (!(rawEnrollment.containsKey ('learn.user.username') &&
          rawEnrollment.containsKey ('learn.course.id') &&
          rawEnrollment.containsKey ('learn.course.name') &&
          rawEnrollment.containsKey ('learn.membership.role') &&
          rawEnrollment.containsKey ('learn.membership.available'))) {
      throw new ImproperEnrollment (
        'The provided enrollment was not formatted correctly.'
      );
    }

    /*return new Enrollment (
      rawEnrollment['learn.user.username'], rawEnrollment['learn.course.id'],
      rawEnrollment['learn.course.name'], rawEnrollment['learn.membership.role'],
      rawEnrollment['learn.membership.available'],
      asArchive: fromArchive
    );*/
  }

  /// The [createAll] method...
  @override
  List<Enrollment> createAll (
    Iterable<Map<String, dynamic>> rawEnrollments, [String type = '', bool fromArchives = false]
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
}
