library plato.archives.models.resource.content_area;

import '../resource.dart';

/// The [ContentArea] class...
class ContentArea extends Resource {
  /// The [ContentArea] constructor...
  ContentArea (String id, String label) :
    super (id, label, 'course/x-bb-coursetoc');
}
