library plato.archives.components.resource.discussion.post;

import 'package:angular/angular.dart';

import 'discussion_post.dart';

/// The [DiscussionPostComponent] class...
@Component(
  selector: 'discussion-post',
  templateUrl: 'discussion_post_component.html',
)
class DiscussionPostComponent {
  DiscussionPost discussionPost;

  /// The [DiscussionPostComponent] constructor...
  DiscussionPostComponent();
}
