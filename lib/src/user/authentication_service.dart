library plato.archives.services.user.authentication;

import 'dart:async' show Future;

const String _AUTHENTICATE_URI = '/plato/authenticate/learn';

const String _LOGOUT_URI = '/plato/cleanup/session';

/// The [AuthenticationService] class...
class AuthenticationService {
  bool _isAuthenticated;

  /// The [AuthenticationService] constructor...
  AuthenticationService() {
    _isAuthenticated = false;
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
      return;  // (throw error)
    }
  }
}
