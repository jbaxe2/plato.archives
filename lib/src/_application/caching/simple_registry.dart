library plato.archives.caching.registry.simple;

import 'registry.dart';

/// The [SimpleRegistry] class...
class SimpleRegistry implements Registry<String, Object> {
  covariant Map<String, Object> _registry;

  static SimpleRegistry _instance;

  /// The [SimpleRegistry] factory constructor...
  factory SimpleRegistry() => _instance ?? (_instance = new SimpleRegistry._());

  /// The [SimpleRegistry] private constructor...
  SimpleRegistry._() {
    _registry = new Map<String, Object>();
  }

  /// The [register] method...
  @override
  void register (String key, covariant Object resource) {
    _registry.putIfAbsent (key, () => resource);
  }

  /// The [unregister] method...
  @override
  dynamic unregister (String key) => _registry.remove (key);

  /// The [retrieve] method...
  @override
  dynamic retrieve (String key) {
    if (_registry.containsKey (key)) {
      return _registry[key];
    }
  }

  /// The [refresh] method...
  @override
  dynamic refresh (String key, covariant Object newResource) {
    dynamic oldResource;

    if (_registry.containsKey (key)) {
      oldResource = _registry[key];
      _registry[key] = newResource;
    }

    return oldResource;
  }

  /// The [contains] method...
  @override
  bool contains (String key) =>
    _registry.containsKey (key) && (null != _registry[key]);

  /// The [isEmpty] method...
  @override
  bool isEmpty() => _registry.isEmpty;

  /// The [clear] method...
  @override
  void clear() => _registry.clear();
}
