library plato.archives.components.enrollment.roster;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../users_service.dart';

import 'roster.dart';

/// The [RosterComponent] class...
@Component(
  selector: 'roster',
  templateUrl: 'roster_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: [UsersService]
)
class RosterComponent {
  Roster roster;

  final UsersService _usersService;

  /// The [RosterComponent] constructor...
  RosterComponent (this._usersService);
}
