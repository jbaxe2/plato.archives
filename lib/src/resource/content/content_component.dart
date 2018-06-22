library plato.archives.components.content;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../resources_service.dart';

import 'content.dart';

/// The [ContentComponent] class...
@Component(
  selector: 'content',
  templateUrl: 'content_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: [ResourcesService]
)
class ContentComponent {
  Content content;

  final ResourcesService _resourcesService;

  /// The [ContentComponent] constructor...
  ContentComponent (this._resourcesService);
}
