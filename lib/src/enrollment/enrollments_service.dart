library plato.archives.services.enrollments;

import 'dart:async' show Future;

import 'package:angular/core.dart';

/// The [EnrollmentsService] class...
@Injectable()
class EnrollmentsService {
  static EnrollmentsService _instance;

  /// The [EnrollmentsService] factory constructor...
  factory EnrollmentsService() =>
    _instance ?? (_instance = new EnrollmentsService._());

  /// The [EnrollmentsService] private constructor...
  EnrollmentsService._();

  /// The [loadEnrollments] method...
  Future<void> loadEnrollments (String archiveId) async {
    ;
  }

  /// The [loadInstructorEnrollment] method...
  Future<void> loadInstructorEnrollment (String archiveId) async {
    ;
  }
}
