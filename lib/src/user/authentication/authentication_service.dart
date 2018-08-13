library plato.archives.services.authentication;

import 'dart:async' show Future, Stream, StreamController;
import 'dart:convert' show json, utf8;

import 'package:angular/core.dart' show Injectable;
import 'package:http/http.dart' show Client, Response;

import 'authentication_error.dart';

const String _AUTHENTICATE_URI = '/plato/authenticate/learn';

const String _LOGOUT_URI = '/plato/cleanup/session';

/// The [AuthenticationService] class...
@Injectable()
class AuthenticationService {
  bool _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated;

  final StreamController<bool> _authenticationController =
    new StreamController<bool>.broadcast();

  Stream<bool> get authenticationStream => _authenticationController.stream;

  final Client _http;

  static AuthenticationService _instance;

  /// The [AuthenticationService] factory constructor...
  factory AuthenticationService (Client http) =>
    _instance ?? (_instance = new AuthenticationService._ (http));

  /// The [AuthenticationService] private constructor...
  AuthenticationService._ (this._http) {
    _isAuthenticated = false;
  }

  /// The [authenticate] method...
  Future<void> authenticate (String username, String password) async {
    if (_isAuthenticated) {
      return;
    }

    if (username.isEmpty || password.isEmpty) {
      throw new AuthenticationError (
        'Cannot authenticate without a username or password.'
      );
    }

    try {
      final Response authResponse = await _http.post (
        _AUTHENTICATE_URI,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'username': username, 'password': password}
      );

      final Map<String, dynamic> rawAuth =
        json.decode (utf8.decode (authResponse.bodyBytes)) as Map;

      if (true == rawAuth['learn.user.authenticated']) {
        _authenticationController.add (_isAuthenticated = true);
      } else {
        throw _isAuthenticated;
      }
    } catch (_) {
      throw new AuthenticationError ('Authentication for the Plato user has failed.');
    }
  }

  /// The [logout] method...
  Future<void> logout() async {
    await _http.get (_LOGOUT_URI);

    _authenticationController.add (_isAuthenticated = false);
  }
}
