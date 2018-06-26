library plato.archives.services.archives.retrieve;

import 'dart:async' show Future;
import 'dart:convert' show json;

import 'package:angular/core.dart';
import 'package:http/http.dart' show Client, Response;

import '../enrollment/enrollment_factory.dart';
import '../enrollment/faculty_enrollment.dart';

import 'non_retrievable_archive.dart';

const String _RETRIEVE_ARCHIVES_URI = '/plato/retrieve/archives';

/// The [RetrieveArchivesService] class...
@Injectable()
class RetrieveArchivesService {
  List<FacultyEnrollment> _facultyArchives;

  List<FacultyEnrollment> get facultyArchives =>
    new List<FacultyEnrollment>.from (_facultyArchives);

  final Client _http;

  static RetrieveArchivesService _instance;

  /// The [RetrieveArchivesService] factory constructor...
  factory RetrieveArchivesService (Client http) =>
    _instance ?? (_instance = new RetrieveArchivesService._ (http));

  /// The [RetrieveArchivesService] private constructor...
  RetrieveArchivesService._ (this._http) {
    _facultyArchives = new List<FacultyEnrollment>();
  }

  /// The [retrieveFacultyEnrollments] method...
  Future<void> retrieveFacultyEnrollments() async {
    try {
      final Response retrieveArchivesResponse =
        await _http.get (_RETRIEVE_ARCHIVES_URI);

      List<Map<String, String>> rawArchives =
        (json.decode (retrieveArchivesResponse.body) as Map)['archives'];

      _facultyArchives =
        (new EnrollmentFactory()).createAll (rawArchives, 'faculty');
    } catch (_) {
      throw new NonRetrievableArchive();
    }
  }
}
