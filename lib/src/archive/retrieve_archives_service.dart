library plato.archives.services.archives.retrieve;

import 'dart:async' show Future;
import 'dart:convert' show json;

import 'package:angular/core.dart';
import 'package:http/http.dart' show Client, Response;

import 'archives_not_retrievable.dart';

const String _RETRIEVE_ARCHIVES_URI = '/plato/retrieve/archives';

/// The [RetrieveArchivesService] class...
@Injectable()
class RetrieveArchivesService {
  final Client _http;

  static RetrieveArchivesService _instance;

  /// The [RetrieveArchivesService] factory constructor...
  factory RetrieveArchivesService (Client http) =>
    _instance ?? (_instance = new RetrieveArchivesService._ (http));

  /// The [RetrieveArchivesService] private constructor...
  RetrieveArchivesService._ (this._http);

  /// The [retrieveArchives] method...
  Future<void> retrieveArchives() async {
    try {
      final Response retrieveArchivesResponse =
        await _http.get (_RETRIEVE_ARCHIVES_URI);

      List<Map<String, String>> rawArchives =
        (json.decode (retrieveArchivesResponse.body) as Map)['archives'];
    } catch (_) {
      throw new ArchivesNotRetrievable();
    }
  }
}
