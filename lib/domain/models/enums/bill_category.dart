import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum BillCategory {
  automobile('automobile'),
  creditCard('creditCard'),
  debt('debt'),
  devices('devices'),
  education('education'),
  electricity('electricity'),
  entertainment('entertainment'),
  groceries('groceries'),
  gas('gas'),
  healthCare('healthCare'),
  insurance('insurance'),
  investment('investment'),
  internet('internet'),
  miscellaneous('miscellaneous'),
  rent('rent'),
  petShop('petShop'),
  telephone('telephone'),
  transportation('transportation'),
  travel('travel'),
  water('water');

  const BillCategory(this.value);
  final String value;

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

  String getIconResponse() {
    switch (this) {
      case automobile:
        return AppIcons.automobile;
      case creditCard:
        return AppIcons.creditCard;
      case debt:
        return AppIcons.debt;
      case devices:
        return AppIcons.devices;
      case education:
        return AppIcons.education;
      case electricity:
        return AppIcons.electricity;
      case entertainment:
        return AppIcons.entertainment;
      case groceries:
        return AppIcons.groceries;
      case gas:
        return AppIcons.gas;
      case healthCare:
        return AppIcons.healthCare;
      case insurance:
        return AppIcons.insurance;
      case investment:
        return AppIcons.investment;
      case internet:
        return AppIcons.internet;
      case miscellaneous:
        return AppIcons.miscellaneous;
      case rent:
        return AppIcons.rent;
      case petShop:
        return AppIcons.petShop;
      case telephone:
        return AppIcons.telephone;
      case transportation:
        return AppIcons.transportation;
      case travel:
        return AppIcons.travel;
      case water:
        return AppIcons.water;
    }
  }
}
