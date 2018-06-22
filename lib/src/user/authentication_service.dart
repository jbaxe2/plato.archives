library plato.archives.services.authentication;

import 'dart:async' show Future;

import 'package:angular/core.dart';

import 'authenticated_user.dart';

const String _AUTHENTICATE_URI = '/plato/authenticate/learn';

const String _LOGOUT_URI = '/plato/cleanup/session';

/// The [AuthenticationService] class...
@Injectable()
class AuthenticationService {
  bool _isAuthenticated;

  AuthenticatedUser _authenticatedUser;

  /// The [AuthenticationService] constructor...
  AuthenticationService() {
    _isAuthenticated = false;
  }

  /// The [checkIfSessionExists] method...
  Future<bool> checkIfSessionExists() async {
    return false;
  }

  /// The [authenticate] method...
  Future<void> authenticate (String username, String password) async {
    if (_isAuthenticated) {
      return;  // (throw error)
    }
  }

  /// The [logout] method...
  Future<void> logout() async {
    if (!_isAuthenticated) {
      return;  // (throw error, or do nothing?)
    }
  }
}
