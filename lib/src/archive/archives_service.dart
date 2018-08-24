library plato.archives.services.archives;

import 'dart:async' show Future;
import 'dart:convert' show json, utf8;

import 'package:angular/core.dart' show Injectable;
import 'package:http/http.dart' show Client, Response;

import '../enrollment/enrollment_factory.dart';
import '../enrollment/faculty_enrollment.dart';

import '../resource/typing/invalid_resource_type.dart';
import '../resource/typing/resource_typing.dart';
import '../resource/typing/resource_typing_factory.dart';

import 'non_retrievable_archive.dart';

const String _RETRIEVE_ARCHIVES_URI = '/plato/retrieve/archives';

const String _INSPECT_ARCHIVE_URI = '/plato/inspect/archive';

/// The [ArchivesService] class...
@Injectable()
class ArchivesService {
  List<FacultyEnrollment> _facultyArchives;

  List<FacultyEnrollment> get facultyArchives =>
    new List<FacultyEnrollment>.from (_facultyArchives);

  final Client _http;

  static ArchivesService _instance;

  /// The [ArchivesService factory constructor...
  factory ArchivesService (Client http) =>
    _instance ?? (_instance = new ArchivesService._ (http));

  /// The [ArchivesService] private constructor...
  ArchivesService._ (this._http) {
    _facultyArchives = new List<FacultyEnrollment>();
  }

  /// The [loadFacultyArchivesList] method...
  Future<void> loadFacultyArchivesList() async {
    try {
      Response retrieveArchivesResponse = await _http.get (_RETRIEVE_ARCHIVES_URI);
      String rawArchivesJson = utf8.decode (retrieveArchivesResponse.bodyBytes);

      List<Map<String, String>> rawArchives =
        (json.decode (rawArchivesJson) as Map)['archives'];

      _facultyArchives =
        (new EnrollmentFactory()).createAll (rawArchives, 'faculty');
    } catch (_) {
      throw new NonRetrievableArchive (
        'The list of faculty archive enrollments was not retrievable.'
      );
    }
  }

  /// The [loadArchiveResourceTypes] method...
  Future<List<ResourceTyping>> loadArchiveResourceTypes() async {
    var resourceTypings = new List<ResourceTyping>();

    try {
      Response inspectArchiveResponse = await _http.get (_INSPECT_ARCHIVE_URI);
      String rawResourceTypesJson = utf8.decode (inspectArchiveResponse.bodyBytes);
      Map<String, String> rawResourceTypes = (json.decode (rawResourceTypesJson) as Map);

      resourceTypings = (new ResourceTypingFactory()).createAllByMap (rawResourceTypes);
    } catch (_) {
      throw new InvalidResourceType (
        'The list of tool types and content for the archived course were not valid.'
      );
    }

    return resourceTypings;
  }

  /// The [loadArchiveResourcesOfType] method...
  Future<void> loadArchiveResourcesOfType (String type) async {
    ;
  }
}
