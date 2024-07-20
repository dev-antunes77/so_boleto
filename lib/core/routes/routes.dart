export 'routes_extensions.dart';

///Represents the entire routes to navigate in the app
class Routes {
  static const app = '/';
  static const login = '/login';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const homeFuture = '/home-future';
  static const homePast = '/home-past';
  static const billCategory = '/bill-category';
  static const billCheck = '/bill-check';
  static const billDueDay = '/bill-due-day';
  static const billName = '/bill-name';
  static const billParcels = '/bill-parcels';
  static const billValue = '/bill-value';
  static const promptBills = '/prompt-bills';
  static const promptBillsEdition = '/prompt-bills-edition';
  static const expenses = '/expenses';
  static const filter = '/filter';
  static const profile = '/profile';
  static const profileTheme = '/profile-theme';
  static const profileViewPicture = '/profile-view-picture';
  static const profileDueDay = '/profile-due-day';
  static const profilePayedTag = '/profile-payed-tag';
  static const profileSecurity = '/profile-security-tag';
}

///Represents the routes with relative paths
///
///It should be used only in the routes_config.dart to easy the configuration
class RelativePaths {
  static const app = '/';
  static const login = '/login';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const homePast = '/home-past';
  static const homeFuture = '/home-future';
  static const billCategory = '/bill-category';
  static const billCheck = '/bill-check';
  static const billDueDay = '/bill-due-day';
  static const billName = '/bill-name';
  static const billParcels = '/bill-parcels';
  static const billValue = '/bill-value';
  static const promptBills = '/prompt-bills';
  static const promptBillsEdition = '/prompt-bills-edition';
  static const expenses = '/expenses';
  static const filter = '/filter';
  static const profile = '/profile';
  static const profileViewPicture = '/profile-view-picture';
  static const profileTheme = '/profile-theme';
  static const profileDueDay = '/profile-due-day';
  static const profilePayedTag = '/profile-payed-tag';
  static const profileSecurity = '/profile-security-tag';
}
