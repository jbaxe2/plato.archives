library plato.archives.components.welcome;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

/// The [WelcomeComponent] class...
@Component(
  selector: 'welcome',
  templateUrl: 'welcome_component.html',
  styleUrls: ['welcome_component.css'],
  directives: [MaterialExpansionPanel]
)
class WelcomeComponent {
  /// The [WelcomeComponent] constructor...
  WelcomeComponent();
}
