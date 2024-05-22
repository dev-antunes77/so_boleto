import 'package:so_boleto/core/routes/routes.dart';

enum BottomNavigatorPage {
  list(0),
  profile(1);

  const BottomNavigatorPage(this.value);

  final int value;

  static BottomNavigatorPage fromIndex(int value) {
    for (BottomNavigatorPage page in BottomNavigatorPage.values) {
      if (page.value == value) {
        return page;
      }
    }

    return list;
  }

  static String getRoute(BottomNavigatorPage page) {
    String route;
    switch (page) {
      case BottomNavigatorPage.list:
        route = Routes.home;
      case BottomNavigatorPage.profile:
        route = Routes.profile;

      default:
        route = Routes.home;
    }

    route += Routes.app;

    return route;
  }
}
