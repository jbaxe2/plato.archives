library plato.archives.models.caching.registry;

/// The [Registry] class...
class Registry {
  Map<String, dynamic> _registry;

  static Registry _instance;

  /// The [Registry] factory constructor...
  factory Registry() => _instance ?? (_instance = new Registry._());

  /// The [Registry] private constructor...
  Registry._ () {
    _registry = new Map<String, dynamic>();
  }

  /// The [register] method...
  void register (String key, dynamic resource) {
    _registry.putIfAbsent (key, () => resource);
  }

  /// The [unregister] method...
  dynamic unregister (String key) => _registry.remove (key);
}
