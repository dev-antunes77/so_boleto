import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum BillCategory {
  automobile(AppIcons.automobile),
  creditCard(AppIcons.creditCard),
  debt(AppIcons.debt),
  devices(AppIcons.devices),
  education(AppIcons.education),
  electricity(AppIcons.electricity),
  entertainment(AppIcons.entertainment),
  groceries(AppIcons.groceries),
  gas(AppIcons.gas),
  healthCare(AppIcons.healthCare),
  insurance(AppIcons.insurance),
  investment(AppIcons.investment),
  internet(AppIcons.internet),
  miscellaneous(AppIcons.miscellaneous),
  rent(AppIcons.rent),
  petShop(AppIcons.petShop),
  telephone(AppIcons.telephone),
  transportation(AppIcons.transportation),
  travel(AppIcons.travel),
  water(AppIcons.water);

  const BillCategory(this.value);
  final String value;

  static List<String> get categoryList {
    List<String> list = [];
    for (var element in BillCategory.values) {
      list.add(element.getTextResponse());
    }
    return list;
  }

  String getTextResponse() {
    switch (this) {
      case automobile:
        return AppLocalizations.current.categoryAutomobile;
      case creditCard:
        return AppLocalizations.current.categoryCreditCard;
      case debt:
        return AppLocalizations.current.categoryDebt;
      case devices:
        return AppLocalizations.current.categoryDevices;
      case education:
        return AppLocalizations.current.categoryEducation;
      case electricity:
        return AppLocalizations.current.categoryElectricity;
      case entertainment:
        return AppLocalizations.current.categoryEntertainment;
      case groceries:
        return AppLocalizations.current.categoryGroceries;
      case gas:
        return AppLocalizations.current.categoryGas;
      case healthCare:
        return AppLocalizations.current.categoryHealthCare;
      case insurance:
        return AppLocalizations.current.categoryInsurance;
      case investment:
        return AppLocalizations.current.categoryInvestment;
      case internet:
        return AppLocalizations.current.categoryInternet;
      case miscellaneous:
        return AppLocalizations.current.categoryMiscellaneous;
      case rent:
        return AppLocalizations.current.categoryRent;
      case petShop:
        return AppLocalizations.current.categorypetShop;
      case telephone:
        return AppLocalizations.current.categoryTelephone;
      case transportation:
        return AppLocalizations.current.categoryTransportation;
      case travel:
        return AppLocalizations.current.categoryTravel;
      case water:
        return AppLocalizations.current.categoryWater;
    }
  }
}
