@TestOn('browser')
library plato.archives.tests.registry.simple;

import 'package:test/test.dart';

import 'package:plato.archives/src/_application/caching/improper_registry_entry.dart';
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
      _testRegistryContainsAddedValue();
      _testAddValuesAndClearResultsInEmptyRegistry();
      _testValueIsRetrievableAfterBeingAdded();
      _testRegistryDoesNotContainValueRemoved();
      _testRetrievingValueIsRefreshedValue();
      _testRefreshNonRegisteredIsImproper();
      _testRefreshNonRegisteredDoesNotContainValue();
    });
  }

  /// The [_testRegistryContainsAddedValue] method...
  void _testRegistryContainsAddedValue() {
    test ('Adding a value to the registry will cause it to contain that value.', () {
      var registry = new SimpleRegistry()
        ..register ('key1', 0);

      expect (registry.contains ('key1'), true);

      registry.clear();
    });
  }

  /// The [_testAddValuesAndClearResultsInEmptyRegistry] method...
  void _testAddValuesAndClearResultsInEmptyRegistry() {
    test ('Adding values to the registry and then clearing it will empty the registry.', () {
      var registry = new SimpleRegistry()
        ..register ('key1', 1)
        ..register ('key2', 2)
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

  /// The [_testRegistryDoesNotContainValueRemoved] method...
  void _testRegistryDoesNotContainValueRemoved() {
    test (
      'Removing a value from the registry causes it to not be part of the registry.',
      () {
        const int value = 0;

        var registry = new SimpleRegistry()
          ..register ('key1', value);

        assert (!registry.isEmpty());

        int removed = registry.unregister ('key1');

        assert (value == removed);
        expect (registry.contains ('key1'), false);

        registry.clear();
      }
    );
  }

  /// The [_testRetrievingValueIsRefreshedValue] method...
  void _testRetrievingValueIsRefreshedValue() {
    test ('Refreshing a value retrieves the refreshed value.', () {
      const int value2 = 2;

      var registry = new SimpleRegistry()
        ..register ('theKey', 1)
        ..refresh ('theKey', value2);

      int retrieved = registry.retrieve ('theKey') as int;

      expect (value2 == retrieved, true);

      registry.clear();
    });
  }

  /// The [_testRefreshNonRegisteredIsImproper] method...
  void _testRefreshNonRegisteredIsImproper() {
    test ('Refreshing a non-registered value throws an improper error.', () {
      const String expected =
        'Unable to refresh a registry entry value when that entry does not exist.';

      var registry = new SimpleRegistry();
      Exception error;

      try {
        registry.refresh ('nonExistingKey', 1);
      } catch (e) {
        error = e;
      }

      assert (error is ImproperRegistryEntry);
      expect (error.toString() == expected, true);

      registry.clear();
    });
  }

  /// The [_testRefreshNonRegisteredDoesNotContainValue] method...
  void _testRefreshNonRegisteredDoesNotContainValue() {
    test ('Registry does not contain a non-registered refreshed value.', () {
      const int value = 1;
      var registry = new SimpleRegistry();

      try {
        registry.refresh ('nonExistingKey', value);
      } catch (_) {}

      expect (registry.contains ('nonExistingKey'), false);

      registry.clear();
    });
  }
}
