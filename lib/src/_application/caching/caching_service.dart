library plato.archives.services.caching;

import 'simple_registry.dart';

/// The [CachingService] class...
class CachingService {
  static final SimpleRegistry _simpleRegistry = new SimpleRegistry();

  static CachingService _instance;

  /// The [CachingService] factory constructor...
  factory CachingService() => _instance ?? (_instance = new CachingService._());

  /// The [CachingService] private constructor...
  CachingService._();

  /// The [cacheObject] method...
  void cacheObject (String key, Object object) {
    if (_simpleRegistry.contains (key)) {
      _simpleRegistry.refresh (key, object);
    } else {
      _simpleRegistry.register (key, object);
    }
  }

  /// The [haveCachedObject] method...
  bool haveCachedObject (String key) => _simpleRegistry.contains (key);

  /// The [retrieveCachedObject] method...
  dynamic retrieveCachedObject (String key) {
    try {
      return _simpleRegistry.retrieve (key);
    } catch (_) {
      rethrow;
    }
  }

  /// The [removeFromCache] method...
  dynamic removeFromCache (String key) {
    try {
      return _simpleRegistry.unregister (key);
    } catch (_) {
      rethrow;
    }
  }
}
