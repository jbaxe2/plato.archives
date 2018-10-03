library plato.archives.components.resource.content_area;

import 'package:angular/angular.dart';

import '../resources_service.dart';

import 'content_area.dart';

/// The [ContentAreaComponent] class...
@Component(
  selector: 'content-area',
  templateUrl: 'content_area_component.html',
  providers: [ResourcesService]
)
class ContentAreaComponent {
  ContentArea contentArea;

  final ResourcesService _resourcesService;

  /// The [ContentAreaComponent] constructor...
  ContentAreaComponent (this._resourcesService);
}
