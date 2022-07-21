import 'package:la_taniere/ui/screens/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/screens/bigContainer/bigContainer_view.dart';
import '../ui/screens/splash/splash_screen_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: SplashScreenView, initial: true),
    CupertinoRoute(page: BigContainerView),
    CupertinoRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
