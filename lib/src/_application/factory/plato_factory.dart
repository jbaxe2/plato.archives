library plato.archives.factory.plato;

/// The [PlatoFactory] abstract class...
abstract class PlatoFactory<T> {
  /// The [create] method...
  T create (Map<String, dynamic> rawInput, [String type]);

  /// The [createAll] method...
  Iterable<T> createAll (Iterable<Map<String, dynamic>> rawInputs, [String type]);
}
