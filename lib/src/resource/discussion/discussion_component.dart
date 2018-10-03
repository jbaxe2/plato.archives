library plato.archives.components.resource.discussion;

import 'package:angular/angular.dart';

import '../resources_service.dart';

import 'discussion.dart';

/// The [DiscussionComponent] class...
@Component(
  selector: 'discussion',
  templateUrl: 'discussion_component.html',
  providers: [ResourcesService]
)
class DiscussionComponent {
  Discussion discussion;

  final ResourcesService _resourcesService;

  /// The [DiscussionComponent] constructor...
  DiscussionComponent (this._resourcesService);
}
