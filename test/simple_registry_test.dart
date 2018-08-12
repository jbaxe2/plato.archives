@TestOn('browser')
library plato.archives.tests.registry.simple;

import 'package:test/test.dart';

import 'package:plato.archives/src/_application/caching/simple_registry.dart';

import 'testable.dart';

/// The [main] function...
void main() => (new SimpleRegistryTester()).run();

/// The [SimpleRegistryTester] class...
class SimpleRegistryTester implements Testable {
  /// The [SimpleRegistryTester] constructor...
  SimpleRegistryTester();

  /// The [run] method...
  @override
  void run() {
    group ('Simple registry:', () {
      _testAddingValueIsActuallyAdded();
      _testAddValuesAndClearResultsInEmptyRegistry();
      _testValueIsRetrievableAfterBeingAdded();
    });
  }

  /// The [_testAddingValueIsActuallyAdded] method...
  void _testAddingValueIsActuallyAdded() {
    test ('Adding a value to a registry will cause it to contain that value.', () {
      const int value = 0;

      var registry = new SimpleRegistry()
        ..register ('key1', value);

      expect (registry.contains ('key1'), true);

      registry.clear();
    });
  }

  /// The [_testAddValuesAndClearResultsInEmptyRegistry] method...
  void _testAddValuesAndClearResultsInEmptyRegistry() {
    test ('Adding values to the registry and then clearing it will empty the registry.', () {
      const int value1 = 1;
      const int value2 = 2;

      var registry = new SimpleRegistry()
        ..register ('key1', value1)
        ..register ('key2', value2)
        ..clear();

      expect (registry.isEmpty(), true);
    });
  }

  /// The [_testValueIsRetrievableAfterBeingAdded] method...
  void _testValueIsRetrievableAfterBeingAdded() {
    test ('A value is retrievable from the registry once it has been added.', () {
      const int value = 0;

      var registry = new SimpleRegistry()
        ..register ('key1', value);

      assert (!registry.isEmpty());

      int retrieved = registry.retrieve ('key1') as int;

      expect ((value == retrieved), true);

      registry.clear();
    });
  }
}
