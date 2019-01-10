library plato.archives.services.authorization;

import 'dart:async' show Future, Stream, StreamController;
import 'dart:convert' show json, utf8;

import 'package:http/http.dart' show Client, Response;

import 'authorization_error.dart';

const String _AUTHENTICATE_URI = '/plato/authenticate/learn';

const String _LOGOUT_URI = '/plato/cleanup/session';

/// The [AuthorizationService] class...
class AuthorizationService {
  bool _isAuthorized;

  bool get isAuthorized => _isAuthorized;

  final StreamController<bool> _authorizationController =
    new StreamController<bool>.broadcast();

  Stream<bool> get authorizationStream => _authorizationController.stream;

  final Client _http;

  static AuthorizationService _instance;

  /// The [AuthorizationService] factory constructor...
  factory AuthorizationService (Client http) =>
    _instance ?? (_instance = new AuthorizationService._ (http));

  /// The [AuthorizationService] private constructor...
  AuthorizationService._ (this._http) {
    _isAuthorized = false;
  }

  /// The [authenticate] method...
  Future<void> authenticate (String username, String password) async {
    if (_isAuthorized) {
      return;
    }

    if (username.isEmpty || password.isEmpty) {
      throw new AuthorizationError (
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
        _authorizationController.add (_isAuthorized = true);
      } else {
        throw _isAuthorized;
      }
    } catch (_) {
      throw new AuthorizationError ('Authorization for the Plato user has failed.');
    }
  }

  /// The [logout] method...
  Future<void> logout() async {
    await _http.get (_LOGOUT_URI);

    _authorizationController.add (_isAuthorized = false);
  }
}
