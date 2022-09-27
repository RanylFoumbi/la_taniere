import 'package:la_taniere/services/api_service.dart';
import 'package:la_taniere/ui/components/article_detail.dart';
import 'package:la_taniere/ui/components/vertical_list.dart';
import 'package:la_taniere/ui/screens/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/components/product_detail.dart';
import '../ui/screens/bigContainer/bigContainer_view.dart';
import '../ui/screens/splash/splash_screen_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: SplashScreenView, initial: true),
    CupertinoRoute(page: BigContainerView),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: VerticalListPage),
    CupertinoRoute(page: ProductDetail),
    CupertinoRoute(page: ArticleDetail),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
