export 'routes_extensions.dart';

///Represents the entire routes to navigate in the app
class Routes {
  static const app = '/';
  static const home = '/home';

  static const billName = '/bill-name';
  static const billDescription = '/bill-name/bill-description';
  static const billParcel = '/bill-name/bill-description/bill-parcel';
  static const billValue =
      '/bill-name/bill-description/bill-parcel/bill-parcel';
  static const billDueDay =
      '/bill-name/bill-description/bill-parcel/bill-parcel/bill-due-day';
  static const billCategory =
      '/bill-name/bill-description/bill-parcel/bill-parcel/bill-due-day/bill-category';
  static const billCheck = '/bill-check';
  static const expenses = '/expenses';
  static const profile = '/profile';

///////////////////////

  static const radios = '/radios';
  static const favorites = '/favorites';

  static const account = '/profile/account';
  static const about = '/profile/about';
  static const editorial = '/profile/editorial';
  static const help = '/profile/help';
  static const policies = '/profile/policies';
  static const requestData = '/profile/request-data';

  static const login = '/login';
  static const loginMsisdn = '/login/msisdn';
  static const loginPinCode = '/login/pincode';
  static const onboarding = '/onboarding';
  static const update = '/update';
}

///Represents the routes with relative paths
///
///It should be used only in the routes_config.dart to easy the configuration
class RelativePaths {
  static const app = '/';
  static const home = '/home';
  static const profile = '/profile';
  static const expenses = '/expenses';
  static const billName = '/bill-name';
  static const billDescription = '/bill-name/bill-description';
  static const billParcel = '/bill-name/bill-description/bill-parcel';
  static const billValue =
      '/bill-name/bill-description/bill-parcel/bill-parcel';
  static const billDueDay =
      '/bill-name/bill-description/bill-parcel/bill-parcel/bill-due-day';
  static const billCategory =
      '/bill-name/bill-description/bill-parcel/bill-parcel/bill-due-day/bill-category';
  static const billCheck = '/bill-check';

/////////////////////////

  static const radios = '/radios';
  static const favorites = '/favorites';
  static const login = '/login';
  static const msisdn = '/login/msisdn';
  static const pinCode = '/login/pincode';
  static const onboarding = '/onboarding';
  static const update = '/update';

  static const about = 'about';
  static const account = 'account';
  static const editorial = 'editorial';
  static const help = 'help';
  static const policies = 'policies';
  static const requestData = 'request-data';
}
