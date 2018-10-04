library plato.archives.models.content.content;

import '../resource.dart';

/// The [Content] class...
class Content extends Resource {
  final String contents;

  /// The [Content] constructor...
  Content (String id, String title, this.contents) :
    super (id, title, 'resource/x-bb-document', contents);
}
