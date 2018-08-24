library plato.archives.factory.resource.typing;

import '../../_application/factory/plato_factory.dart';

import 'invalid_resource_type.dart';
import 'resource_typing.dart';

/// The [ResourceTypingFactory] class...
class ResourceTypingFactory implements PlatoFactory<ResourceTyping> {
  /// The [ResourceTypingFactory] constructor...
  ResourceTypingFactory();

  /// The [create] method...
  @override
  ResourceTyping create (Map<String, String> rawResourceTyping, [_]) {
    try {
      if (1 != rawResourceTyping.length) {
        throw rawResourceTyping;
      }

      return new ResourceTyping (
        rawResourceTyping.keys.first, rawResourceTyping.values.first
      );
    } catch (_) {
      throw new InvalidResourceType ('The provided resource typing is not usable.');
    }
  }

  /// The [createAll] method...
  @override
  List<ResourceTyping> createAll (
    Iterable<Map<String, String>> rawResourceTypings, [_]
  ) {
    var resourceTypings = new List<ResourceTyping>();

    try {
      rawResourceTypings.forEach (
        (Map<String, String> resourceTyping) =>
          resourceTypings.add (create (resourceTyping))
      );
    } catch (_) {
      rethrow;
    }

    return resourceTypings;
  }

  /// The [createAllByMap] method...
  List<ResourceTyping> createAllByMap (Map<String, String> rawResourceTypings) {
    var resourceTypings = new List<ResourceTyping>();

    try {
      rawResourceTypings.forEach ((String typeId, String typeTitle) {
        resourceTypings.add (create ({typeId: typeTitle}));
      });
    } catch (_) {
      rethrow;
    }

    return resourceTypings;
  }
}
