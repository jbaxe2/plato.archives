@TestOn('browser')
library plato.archives.tests.factory.user;

import 'package:test/test.dart';

import 'package:plato.archives/src/user/improper_user.dart';
import 'package:plato.archives/src/user/user.dart';
import 'package:plato.archives/src/user/user_factory.dart';
import 'package:plato.archives/src/user/session/session_user.dart';

import '../data/user_test_data.dart';

import '../testable.dart';

/// The [main] function...
void main() => (new UserFactoryTester()).run();

/// The [UserFactoryTester] class...
class UserFactoryTester implements Testable {
  /// The [UserFactoryTester] constructor...
  UserFactoryTester();

  /// The [run] method...
  @override
  void run() {
    group ('User factory:', () {
      _testCreateArchiveUser();
      _testCreateSessionUser();
      _testCreateLtiSessionUser();
      _testCreateArchiveUserMissingInfoFails();
      _testCreateSessionUserMissingInfoFails();
    });
  }

  /// The [_testCreateArchiveUser] method...
  void _testCreateArchiveUser() {
    test ('Create an archive user from raw data.', () {
      var factory = new UserFactory();

      User archiveUser = factory.create (raw_archive_user);

      assert (null != archiveUser);
      expect (archiveUser.username == raw_archive_user['username'], true);
    });
  }

  /// The [_testCreateSessionUser] method...
  void _testCreateSessionUser() {
    test ('Create a session user from raw data.', () {
      var factory = new UserFactory();

      SessionUser sessionUser =
        factory.create (raw_session_user, 'session') as SessionUser;

      assert (null != sessionUser);
      assert (!sessionUser.isLtiSession);

      bool result =
        (sessionUser.username == raw_session_user['learn.user.username']);

      expect (result, true);

      sessionUser.clear();
    });
  }

  /// The [_testCreateLtiSessionUser] method...
  void _testCreateLtiSessionUser() {
    test ('Create an LTI-based session user from raw data.', () {
      var factory = new UserFactory();

      SessionUser sessionUser =
        factory.create (raw_lti_session_user, 'session') as SessionUser;

      assert (null != sessionUser);
      assert (sessionUser.isLtiSession);

      bool result =
        (sessionUser.username == raw_session_user['learn.user.username']);

      expect (result, true);

      sessionUser.clear();
    });
  }

  /// The [_testCreateArchiveUserMissingInfoFails] method...
  void _testCreateArchiveUserMissingInfoFails() {
    test ('Attempting to create an archive user with missing info fails.', () {
      var missingUser = new Map<String, String>.from (raw_archive_user)
        ..remove ('username');

      const String expected = 'Missing required archive user information.';

      Exception error;

      try {
        (new UserFactory()).create (missingUser);
      } catch (e) {
        error = e;
      }

      assert (error is ImproperUser);
      expect (error.toString() == expected, true);
    });
  }

  /// The [_testCreateSessionUserMissingInfoFails] method...
  void _testCreateSessionUserMissingInfoFails() {
    test ('Attempting to create a session user with missing info fails.', () {
      var missingSessionUser = new Map<String, Object>.from (raw_session_user)
        ..remove ('learn.user.username');

      const String expected = 'Missing required session user information.';

      Exception error;

      try {
        (new UserFactory()).create (missingSessionUser, 'session');
      } catch (e) {
        error = e;
      }

      assert (error is ImproperUser);
      expect (error.toString() == expected, true);
    });
  }
}
