library plato.archives.services.user;

import 'dart:async' show Future;
import 'dart:convert' show json;

import 'package:angular/core.dart';
import 'package:http/http.dart' show Client, Response;

import 'session/session_user.dart';

import 'improper_user_error.dart';
import 'user.dart';
import 'user_factory.dart';

const String _RETRIEVE_USER_URI = '/plato/retrieve/user';

const String _RETRIEVE_ROSTER_URI = '/plato/retrieve/roster/archive';

/// The [UsersService] class...
@Injectable()
class UsersService {
  Client _http;

  static UsersService _instance;

  /// The [UsersService] factory constructor...
  factory UsersService (Client http) =>
    _instance ?? (_instance = new UsersService._ (http));

  /// The [UsersService] private constructor...
  UsersService._ (this._http);

  /// The [retrieveUser] method...
  Future<SessionUser> retrieveUser (
    String username, {String password = '', bool isLtiSession = false}
  ) async {
    SessionUser user;

    try {
      final Response userResponse = await _http.get (_RETRIEVE_USER_URI);

      final Map<String, dynamic> rawUser =
        (json.decode (userResponse.body) as Map)['user'];

      if (rawUser['learn.user.username'] != username) {
        throw username;
      }

      rawUser
        ..['username'] = username
        ..['password'] = password
        ..['isLtiSession'] = isLtiSession;

      user = (new UserFactory()).createUser ('session', rawUser);
    } catch (_) {
      throw new ImproperUserError ('Unable to retrieve the user information.');
    }

    return user;
  }

  /// The [retrieveRoster] method...
  Future<List<User>> retrieveRoster (String archiveId) async {
    var roster = new List<User>();

    return roster;
  }
}
