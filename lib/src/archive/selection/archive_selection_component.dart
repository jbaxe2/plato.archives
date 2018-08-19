library plato.archives.components.archive.selection;

import 'dart:async' show Future;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../_application/caching/caching_service.dart';
import '../../_application/progress/progress_service.dart';
import '../../_application/workflow/workflow_service.dart';

import '../../enrollment/faculty_enrollment.dart';

import '../archives_service.dart';

/// The [ArchiveSelectionComponent] class...
@Component(
  selector: 'archive-selection',
  templateUrl: 'archive_selection_component.html',
  styleUrls: ['archive_selection_component.css'],
  directives: [
    MaterialRadioComponent, MaterialRadioGroupComponent,
    NgIf, NgFor, NgModel
  ],
  providers: [
    ArchivesService, CachingService, ProgressService, WorkflowService
  ]
)
class ArchiveSelectionComponent implements AfterViewInit {
  List<FacultyEnrollment> archiveEnrollments;

  FacultyEnrollment archiveEnrollment;

  final ArchivesService _archivesService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  final WorkflowService _workflowService;

  /// The [ArchiveSelectionComponent] constructor...
  ArchiveSelectionComponent (
    this._archivesService, this._cachingService, this._progressService,
    this._workflowService
  ) {
    archiveEnrollments = new List<FacultyEnrollment>();
  }

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    if (_loadFromCache()) {
      return;
    }

    await _loadArchiveEnrollments();
  }

  /// The [archiveEnrollmentSelected] method...
  void archiveEnrollmentSelected (FacultyEnrollment enrollment) {
    _cachingService.cacheObject ('archiveEnrollments', archiveEnrollments);
    _cachingService.cacheObject (
      'archiveEnrollment', (archiveEnrollment = enrollment)
    );

    _workflowService.markArchiveEnrollmentSelected();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    if (!_cachingService.haveCachedObject ('archiveEnrollments')) {
      return false;
    }

    archiveEnrollments = _cachingService.retrieveCachedObject ('archiveEnrollments');
    archiveEnrollment = _cachingService.retrieveCachedObject ('archiveEnrollment');

    return true;
  }

  /// The [_loadArchiveEnrollments] method...
  Future<void> _loadArchiveEnrollments() async {
    _progressService.invoke ('Determining if there are any archives to review.');

    try {
      await _archivesService.loadFacultyArchivesList();
      archiveEnrollments = _archivesService.facultyArchives;
    } catch (_) {}

    _progressService.revoke();
  }
}
