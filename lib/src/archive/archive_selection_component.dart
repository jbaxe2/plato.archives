library plato.archives.components.archive.selection;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'archive.dart';

/// The [ArchiveSelectionComponent] class...
@Component(
  selector: 'archive-selection',
  templateUrl: 'archive_selection_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: []
)
class ArchiveSelectionComponent {
  List<Archive> archives;

  Archive selected;

  /// The [ArchiveSelectionComponent] constructor...
  ArchiveSelectionComponent();
}
