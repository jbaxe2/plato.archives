library plato.archives.components.resource.discussion;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../resources_service.dart';

import 'discussion.dart';

/// The [DiscussionComponent] class...
@Component(
  selector: 'discussion',
  templateUrl: 'discussion_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: [ResourcesService]
)
class DiscussionComponent {
  Discussion discussion;

  final ResourcesService _resourcesService;

  /// The [DiscussionComponent] constructor...
  DiscussionComponent (this._resourcesService);
}
