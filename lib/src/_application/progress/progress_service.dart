library plato.archives.services.progress;

import 'dart:async' show StreamController;

import 'package:angular/core.dart' show Injectable;

/// The [ProgressService] class...
@Injectable()
class ProgressService {
  StreamController<String> messageStreamController;

  /// The [ProgressService] constructor...
  ProgressService();

  /// The [invoke] method...
  void invoke (String message) => messageStreamController.add (
    message ?? '(Status indicator invoked with unkown message.)'
  );

  /// The [revoke] method...
  void revoke() => messageStreamController.add (null);
}
