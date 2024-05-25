export 'routes_extensions.dart';

///Represents the entire routes to navigate in the app
class Routes {
  static const app = '/';
  static const home = '/home';
  static const bill = '/bill';
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
  static const bill = '/bill';

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
