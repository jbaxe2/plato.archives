library plato.archives.models.resource.discussion;

import '../resource.dart';

import 'discussion_post.dart';

/// The [Discussion] class...
class Discussion extends Resource {
  final String description;

  final List<DiscussionPost> posts;

  /// The [Discussion] constructor...
  Discussion (String id, String title, this.description, this.posts) :
    super (id, title, 'resource/x-bb-discussionboard', description);
}
