library plato.archives.tests.data.enrollment;

import 'package:plato.archives/src/enrollment/archive_enrollment.dart';
import 'package:plato.archives/src/enrollment/enrollment.dart';
import 'package:plato.archives/src/enrollment/faculty_enrollment.dart';

/// A sample enrollment instance.
var enrollment = new Enrollment (
  'CAIS0117001_facdemo', 'CAIS0117001', 'INTRO TO PROGRAMMING', 'facdemo',
  'Student', true, forArchive: false
);

/// A sample archive enrollment instance.
var archive_enrollment = new ArchiveEnrollment (
  'CAIS0117001_facdemo', 'CAIS0117001', 'INTRO TO PROGRAMMING', 'facdemo',
  'Student', true
);

/// A sample faculty enrollment instance.
var faculty_enrollment = new FacultyEnrollment (
  'CAIS0117001_facdemo', 'CAIS0117001', 'INTRO TO PROGRAMMING', 'facdemo', true
);

/// A sample raw enrollment.
Map<String, Object> raw_enrollment = {
  'banner.user.cwid': 'facdemo',
  'learn.course.id': 'CAIS0117001',
  'learn.course.name': 'INTRO TO PROGRAMMING',
  'learn.membership.role': 'Student',
  'learn.membership.available': true,
  'learn.user.username': 'facdemo'
};

/// A sample raw archive enrollment.
Map<String, Object> raw_archive_enrollment = {
  'banner.user.cwid': 'facdemo',
  'learn.course.id': 'CAIS0117001',
  'learn.course.name': 'INTRO TO PROGRAMMING',
  'learn.membership.role': 'Student',
  'learn.membership.available': true,
  'learn.user.username': 'facdemo'
};

/// A sample raw faculty enrollment.
Map<String, Object> raw_faculty_enrollment = {
  'banner.user.cwid': 'facdemo',
  'learn.course.id': 'CAIS0117001',
  'learn.course.name': 'INTRO TO PROGRAMMING',
  'learn.membership.role': 'Instructor',
  'learn.membership.available': true,
  'learn.user.username': 'facdemo'
};
