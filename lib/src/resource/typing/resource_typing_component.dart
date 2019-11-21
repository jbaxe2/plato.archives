library plato.archives.components.resource.typing;

import 'dart:async' show Future;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../_application/caching/caching_service.dart';
import '../../_application/progress/progress_service.dart';
import '../../_application/workflow/workflow_service.dart';

import '../../archive/archives_service.dart';
import '../../archive/non_retrievable_archive.dart';

import '../../enrollment/faculty_enrollment.dart';

import 'resource_typing.dart';

/// The [ResourceTypingComponent] class...
@Component(
  selector: 'resource-typing',
  templateUrl: 'resource_typing_component.html',
  directives: [
    MaterialRadioComponent, MaterialRadioGroupComponent,
    NgIf, NgFor, NgModel
  ],
  providers: [
    ArchivesService, CachingService, ProgressService, WorkflowService
  ]
)
class ResourceTypingComponent implements AfterViewInit {
  FacultyEnrollment archiveEnrollment;

  List<ResourceTyping> resourceTypings;

  ResourceTyping resourceTyping;

  final ArchivesService _archivesService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  final WorkflowService _workflowService;

  /// The [ResourceTypingComponent] constructor...
  ResourceTypingComponent (
    this._archivesService, this._cachingService, this._progressService,
    this._workflowService
  ) {
    resourceTypings = new List<ResourceTyping>();
  }

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    try {
      if (_loadFromCache()) {
        return;
      }

      await _loadArchiveForTypings();
      await _loadArchiveResourceTypes();
    } catch (_) {}
  }

  /// The [resourceTypingSelected] method...
  void resourceTypingSelected (ResourceTyping typing) {
    _cachingService.cacheObject ('resourceTypings', resourceTypings);
    _cachingService.cacheObject ('resourceTyping', (resourceTyping = typing));

    _workflowService.markResourceTypeSelected();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    if (!_cachingService.haveCachedObject ('archiveEnrollment')) {
      throw new NonRetrievableArchive (
        'Unable to load part types of an archive when no archive has been selected.'
      );
    }

    archiveEnrollment = _cachingService.retrieveCachedObject ('archiveEnrollment');
    String cachedArchiveTypes = '${archiveEnrollment.courseId}_resource_types';

    if (!_cachingService.haveCachedObject (cachedArchiveTypes)) {
      return false;
    }

    resourceTypings = _cachingService.retrieveCachedObject (cachedArchiveTypes)
      as List<ResourceTyping>;

    resourceTyping = _cachingService.retrieveCachedObject ('resourceTyping')
      as ResourceTyping;

    _workflowService.markResourceTypeSelected();

    return true;
  }

  /// The [_loadArchiveForTypings] method...
  Future<void> _loadArchiveForTypings() async {
    _progressService.invoke (
      'Loading the archive; this may take a few moments for larger courses.'
    );

    try {
      await _archivesService.loadArchive (archiveEnrollment.courseId);
    } catch (_) {}

    _progressService.revoke();
  }

  /// The [_loadArchiveResourceTypes] method...
  Future<void> _loadArchiveResourceTypes() async {
    _progressService.invoke ('Attempting to load archive content and tool types.');

    try {
      resourceTypings = await _archivesService.loadArchiveResourceTypes (
        archiveEnrollment.courseId
      );

      resourceTypings.removeWhere (
        (typing) => _hiddenResources().contains (typing.id)
      );

      _cachingService.cacheObject (
        '${archiveEnrollment.courseId}_resource_types', resourceTypings
      );
    } catch (_) {}

    _progressService.revoke();
  }

  /// The [_hiddenResources] method...
  List<String> _hiddenResources() {
    return const [
      'course/x-bb-coursetoc',
      'course/x-bb-user',
      'membership/x-bb-coursemembership'
      'resource/x-bb-document',
    ];
  }
}
