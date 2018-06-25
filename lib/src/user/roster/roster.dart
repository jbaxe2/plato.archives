library plato.archives.models.enrollment.roster;

import '../user.dart';

/// The [Roster] class...
class Roster {
  final String courseId;

  final List<User> users;

  /// The [Roster] constructor...
  Roster (this.courseId, this.users);
}
