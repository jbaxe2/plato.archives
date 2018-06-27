library plato.archives.services.archives;

import 'dart:async' show Future;
import 'dart:convert' show json;

import 'package:angular/core.dart' show Injectable;
import 'package:http/http.dart' show Client, Response;

import 'non_retrievable_archive.dart';

import '../enrollment/enrollment_factory.dart';
import '../enrollment/faculty_enrollment.dart';

const String _RETRIEVE_ARCHIVES_URI = '/plato/retrieve/archives';

/// The [ArchivesService] class...
@Injectable()
class ArchivesService {
  List<FacultyEnrollment> _facultyArchives;

  List<FacultyEnrollment> get facultyArchives =>
    new List<FacultyEnrollment>.from (_facultyArchives);

  final Client _http;

  static ArchivesService _instance;

  /// The [ArchivesService] factory constructor...
  factory ArchivesService (Client http) =>
    _instance ?? (_instance = new ArchivesService._ (http));

  /// The [ArchivesService] private constructor...
  ArchivesService._ (this._http) {
    _facultyArchives = new List<FacultyEnrollment>();
  }

  /// The [loadFacultyArchivesList] method...
  Future<void> loadFacultyArchivesList() async {
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
