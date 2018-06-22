library plato.archives.models.resource.discussion.post;

import '../resource.dart';

/// The [DiscussionPost] class...
class DiscussionPost extends Resource {
  final String text;

  final String userId;

  final String forumId;

  final List<DiscussionPost> subPosts;

  /// The [DiscussionPost] constructor...
  DiscussionPost (
    String id, String title, this.text, this.userId, this.forumId, this.subPosts
  ) : super (id, title, 'resource/x-bb-discussionboard');
}
