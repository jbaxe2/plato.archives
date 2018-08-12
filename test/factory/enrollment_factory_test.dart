@TestOn('browser')
library plato.archives.tests.factory.enrollment;

import 'package:test/test.dart';

import 'package:plato.archives/src/enrollment/archive_enrollment.dart';
import 'package:plato.archives/src/enrollment/enrollment.dart';
import 'package:plato.archives/src/enrollment/enrollment_factory.dart';
import 'package:plato.archives/src/enrollment/faculty_enrollment.dart';
import 'package:plato.archives/src/enrollment/improper_enrollment.dart';

import '../data/enrollment_test_data.dart';

import '../testable.dart';

/// The [main] function...
void main() => (new EnrollmentFactoryTester()).run();

/// The [EnrollmentFactoryTester] class...
class EnrollmentFactoryTester implements Testable {
  /// The [EnrollmentFactoryTester] constructor...
  EnrollmentFactoryTester();

  /// The [run] method...
  @override
  void run() {
    group ('Enrollment factory:', () {
      _testCreateRegularEnrollment();
      _testCreateArchiveEnrollment();
      _testCreateFacultyEnrollment();
      _testCreateEnrollmentFailsIfMissingInfo();
      _testCreateFacultyEnrollmentFailsForNonInstructor();
    });
  }

  /// The [_testCreateRegularEnrollment] method...
  void _testCreateRegularEnrollment() {
    test ('Create a regular enrollment from raw data using the factory.', () {
      var factory = new EnrollmentFactory();

      Enrollment enrollment = factory.create (raw_enrollment);

      assert (null != enrollment);
      expect ((enrollment.courseId == raw_enrollment['learn.course.id']), true);
    });
  }

  /// The [_testCreateArchiveEnrollment] method...
  void _testCreateArchiveEnrollment() {
    test ('Create an archive enrollment from raw data using the factory.', () {
      var factory = new EnrollmentFactory();

      Enrollment enrollment = factory.create (raw_archive_enrollment, 'archive');

      assert (null != enrollment);
      assert (enrollment is ArchiveEnrollment);
      expect ((enrollment.courseId == raw_enrollment['learn.course.id']), true);
    });
  }

  /// The [_testCreateFacultyEnrollment] method...
  void _testCreateFacultyEnrollment() {
    test ('Create a faculty enrollment from raw data using the factory.', () {
      var factory = new EnrollmentFactory();

      Enrollment enrollment = factory.create (raw_faculty_enrollment, 'faculty');

      assert (null != enrollment);
      assert (enrollment is FacultyEnrollment);
      expect ((enrollment.courseId == raw_enrollment['learn.course.id']), true);
    });
  }

  /// The [_testCreateEnrollmentFailsIfMissingInfo] method...
  void _testCreateEnrollmentFailsIfMissingInfo() {
    test ('Creating an enrollment will fail if required info is missing.', () {
      var missingEnrollment = new Map<String, Object>.from (raw_enrollment)
        ..remove ('learn.course.id');

      final String expected = 'The provided enrollment was not formatted correctly.';

      Exception error;

      try {
        (new EnrollmentFactory()).create (missingEnrollment);
      } catch (e) {
        error = e;
      }

      assert (error is ImproperEnrollment);
      expect (error.toString() == expected, true);
    });
  }

  /// The [_testCreateFacultyEnrollmentFailsForNonInstructor] method...
  void _testCreateFacultyEnrollmentFailsForNonInstructor() {
    test ('Creating a faculty enrollment fails if data is not for an instructor.', () {
      const String expected =
        'Attempted to create a faculty enrollment without an instructor role.';

      Exception error;

      try {
        (new EnrollmentFactory()).create (raw_enrollment, 'faculty');
      } catch (e) {
        error = e;
      }

      assert (error is ImproperEnrollment);
      expect (error.toString() == expected, true);
    });
  }
}
