library plato.archives.models.resource;

import '../archive/manifestable.dart';

/// The [Resource] class...
class Resource implements Manifestable {
  final String id;

  final String title;

  final String type;

  final String content;

  final bool isCulled;

  /// The [Resource] constructor...
  Resource (this.id, this.title, this.type, this.content, this.isCulled);
}
