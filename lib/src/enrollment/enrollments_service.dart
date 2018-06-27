library plato.archives.services.enrollments;

import 'dart:async' show Future;

import 'package:angular/core.dart' show Injectable;
import 'package:http/http.dart' show Client;

/// The [EnrollmentsService] class...
@Injectable()
class EnrollmentsService {
  final Client _http;

  static EnrollmentsService _instance;

  /// The [EnrollmentsService] factory constructor...
  factory EnrollmentsService (Client http) =>
    _instance ?? (_instance = new EnrollmentsService._ (http));

  /// The [EnrollmentsService] private constructor...
  EnrollmentsService._ (this._http);

  /// The [loadArchiveEnrollments] method...
  Future<void> loadArchiveEnrollments (String archiveId) async {
    ;
  }

  /// The [loadArchiveInstructorEnrollment] method...
  Future<void> loadArchiveInstructorEnrollment (String archiveId) async {
    ;
  }
}
