library plato.archives.caching.registry;

/// The [Registry] class...
abstract class Registry<S, T> {
  /// The [register] method...
  void register (S key, T resource);

  /// The [unregister] method...
  T unregister (S key);
}
