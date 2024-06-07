export 'routes_extensions.dart';

///Represents the entire routes to navigate in the app
class Routes {
  static const app = '/';
  static const home = '/home';
  static const billCategory = '/bill-category';
  static const billCheck = '/bill-check';
  static const billDueDay = '/bill-due-day';
  static const billName = '/bill-name';
  static const billParcels = '/bill-parcels';
  static const billValue = '/bill-value';
  static const promptBills = '/prompt_bills';
  static const expenses = '/expenses';
  static const filter = '/filter';
  static const profile = '/profile';
}

///Represents the routes with relative paths
///
///It should be used only in the routes_config.dart to easy the configuration
class RelativePaths {
  static const app = '/';
  static const home = '/home';
  static const billCategory = '/bill-category';
  static const billCheck = '/bill-check';
  static const billDueDay = '/bill-due-day';
  static const billName = '/bill-name';
  static const billParcels = '/bill-parcels';
  static const billValue = '/bill-value';
  static const promptBills = '/prompt_bills';
  static const expenses = '/expenses';
  static const filter = '/filter';
  static const profile = '/profile';
}
