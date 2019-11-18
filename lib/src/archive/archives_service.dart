library plato.archives.services.archives;

import 'dart:async' show Future;
import 'dart:convert' show json, utf8;

import 'package:http/http.dart' show Client, Response;

import '../enrollment/enrollment_factory.dart';
import '../enrollment/faculty_enrollment.dart';

import '../organization/invalid_organization.dart';
import '../organization/organization.dart';
import '../organization/organization_factory.dart';

import '../resource/typing/invalid_resource_type.dart';
import '../resource/typing/resource_typing.dart';
import '../resource/typing/resource_typing_factory.dart';

import '../resource/invalid_resource.dart';
import '../resource/resource.dart';
import '../resource/resources_factory.dart';

import 'non_retrievable_archive.dart';

const String _RETRIEVE_ARCHIVES_URI = '/plato/retrieve/archives';

const String _PULL_ARCHIVE_URI = '/plato/pull/archive';

const String _INSPECT_ARCHIVE_URI = '/plato/inspect/archive';

const String _BROWSE_ARCHIVE_URI = '/plato/browse/archive';

/// The [ArchivesService] class...
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

  /// The [loadArchive] method...
  Future<void> loadArchive (String archiveId) async {
    final String termId = (archiveId.split ('_')).last;

    try {
      Response loadArchiveResponse = await _http.get (
        '$_PULL_ARCHIVE_URI?archiveId=$archiveId&archiveTerm=$termId'
      );

      final String pulledArchive =
        json.decode (utf8.decode (loadArchiveResponse.bodyBytes))['pulled'];

      if (pulledArchive != archiveId) {
        throw pulledArchive;
      }
    } catch (_) {
      throw new NonRetrievableArchive (
        'Unable to load the selected archive for reviewing types.'
      );
    }
  }

  /// The [loadArchiveResourceTypes] method...
  Future<List<ResourceTyping>> loadArchiveResourceTypes (String archiveId) async {
    var resourceTypings = new List<ResourceTyping>();

    try {
      Response inspectArchiveResponse =
        await _http.get ('$_INSPECT_ARCHIVE_URI?archiveId=$archiveId');

      String rawResourceTypesJson = utf8.decode (inspectArchiveResponse.bodyBytes);
      Map<String, String> rawResourceTypes = json.decode (rawResourceTypesJson) as Map;

      if (rawResourceTypes.containsKey ('error')) {
        throw rawResourceTypes['error'];
      }

      resourceTypings = (new ResourceTypingFactory()).createAllByMap (rawResourceTypes);
    } catch (e) {
      String error =
        'The list of tool types and content for the archived course were not valid.';

      if (e is String) {
        error += '\n\n$e';
      }

      throw new InvalidResourceType (error);
    }

    return resourceTypings;
  }

  /// The [loadArchiveOrganizations] method...
  Future<List<Organization>> loadArchiveOrganizations (
    String archiveId, String archiveTitle
  ) async {
    var organizations = new List<Organization>();

    try {
      Response orgsResponse = await _http.get (
        '$_INSPECT_ARCHIVE_URI?archiveId=$archiveId&resourceType=course/x-bb-outline'
      );

      String rawOrgsJson = utf8.decode (orgsResponse.bodyBytes);
      Map<String, dynamic> rawOrgs = json.decode (rawOrgsJson) as Map;

      organizations.add (((new OrganizationFactory()).create (rawOrgs, archiveTitle)));
    } catch (_) {
      throw new InvalidOrganization ('Unable to review the course outline.');
    }

    return organizations;
  }

  /// The [loadArchiveResourcesOfType] method...
  Future<List<Resource>> loadArchiveResourcesOfType (
    String archiveId, String type
  ) async {
    var resources = new List<Resource>();

    try {
      Response resourceResponse = await _http.get (
        '$_INSPECT_ARCHIVE_URI?archiveId=$archiveId&resourceType=$type'
      );

      String rawResponseJson = utf8.decode (resourceResponse.bodyBytes);
      Map<String, String> rawResources = json.decode (rawResponseJson) as Map;

      resources = (new ResourcesFactory()).createAllByMap (rawResources, type);
    } catch (_) {
      throw new InvalidResourceType ('Unable to view the $type resources.');
    }

    return resources;
  }

  /// The [loadArchiveResource] method...
  Future<Resource> loadArchiveResource (String archiveId, String resourceId) async {
    Resource resource;

    try {
      Response resourceResponse = await _http.get (
        '$_BROWSE_ARCHIVE_URI?archiveId=$archiveId&resourceId=$resourceId'
      );

      if (403 == resourceResponse.statusCode) {
        throw resourceResponse;
      }

      String rawResourceJson = utf8.decode (resourceResponse.bodyBytes);
      Map<String, dynamic> rawResource = json.decode (rawResourceJson) as Map;

      resource = (new ResourcesFactory()).create (rawResource);
    } catch (_) {
      throw new InvalidResource (
        'Unable to retrieve the specified resource from the archive.'
      );
    }

    return resource;
  }
}
