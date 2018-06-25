library plato.archives.components.archive;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'archive.dart';

/// The [ArchiveComponent] class...
@Component(
  selector: 'archive',
  templateUrl: 'archive_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: []
)
class ArchiveComponent {
  Archive archive;

  /// The [ArchiveComponent] constructor...
  ArchiveComponent();
}
