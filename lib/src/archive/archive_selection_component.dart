library plato.archives.components.archive.selection;

import 'dart:async' show Future;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../_application/progress/progress_service.dart';

import '../enrollment/faculty_enrollment.dart';

import 'archives_service.dart';

/// The [ArchiveSelectionComponent] class...
@Component(
  selector: 'archive-selection',
  templateUrl: 'archive_selection_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: [ArchivesService, ProgressService]
)
class ArchiveSelectionComponent implements AfterViewInit {
  List<FacultyEnrollment> archiveEnrollments;

  FacultyEnrollment selected;

  final ArchivesService _archivesService;

  final ProgressService _progressService;

  /// The [ArchiveSelectionComponent] constructor...
  ArchiveSelectionComponent (this._archivesService, this._progressService) {
    archiveEnrollments = new List<FacultyEnrollment>();
  }

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    _progressService.invoke ('Determining if there are any archives to review.');

    try {
      await _archivesService.loadFacultyArchivesList();
      archiveEnrollments = _archivesService.facultyArchives;
    } catch (_) {}

    _progressService.revoke();
  }
}
