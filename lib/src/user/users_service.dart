library plato.archives.services.user;

import 'dart:async' show Future;
import 'dart:convert' show json, utf8;

import 'package:http/http.dart' show Client, Response;

import 'session/session_user.dart';

import 'improper_user.dart';
import 'user.dart';
import 'user_factory.dart';

const String _RETRIEVE_USER_URI = '/plato/retrieve/user';

const String _RETRIEVE_ROSTER_URI = '/plato/retrieve/roster/archive';

/// The [UsersService] class...
class UsersService {
  final Client _http;

  static UsersService _instance;

  /// The [UsersService] factory constructor...
  factory UsersService (Client http) =>
    _instance ?? (_instance = new UsersService._ (http));

  /// The [UsersService] private constructor...
  UsersService._ (this._http);

  /// The [retrieveUser] method...
  Future<SessionUser> retrieveUser ({bool isLtiSession = false}) async {
    SessionUser user;

    try {
      final Response userResponse = await _http.get (_RETRIEVE_USER_URI);

      final Map<String, dynamic> rawUser =
        (json.decode (utf8.decode (userResponse.bodyBytes)) as Map)['user'];

      rawUser
        ..['password'] = ''
        ..['isLtiSession'] = isLtiSession;

      user = (new UserFactory()).create (rawUser, 'session');
    } catch (_) {
      throw new ImproperUser ('Unable to retrieve the user information.');
    }

    return user;
  }

  /// The [retrieveRoster] method...
  Future<List<User>> retrieveRoster (String archiveId) async {
    var roster = new List<User>();

    try {
      final Response rosterResponse = await _http.get (_RETRIEVE_ROSTER_URI);

      final List<Map<String, dynamic>> rawRoster =
        (json.decode (rosterResponse.body) as Map)['roster'];
    } catch (_) {
      ;
    }

    return roster;
  }
}
