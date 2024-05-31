import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum BillCategory {
  automobile,
  communication,
  creditCard,
  debt,
  devices,
  education,
  electricity,
  entertainment,
  groceries,
  healthCare,
  insurance,
  investment,
  internet,
  miscellaneous,
  rent,
  transportation,
  travel,
  water,
}

List<String> get categoryList {
  List<String> list = [];
  for (var element in categoryMap.entries) {
    list.add(element.value['string']);
  }
  return list;
}

Map<BillCategory, dynamic> categoryMap = {
  BillCategory.automobile: {
    'string': 'Automobile',
    'icon': AppIcons.automobile,
  },
  BillCategory.communication: {
    'string': 'Communication',
    'icon': AppIcons.phone,
  },
  BillCategory.creditCard: {
    'string': 'Credit card',
    'icon': AppIcons.creditCard,
  },
  BillCategory.debt: {
    'string': 'Debt',
    'icon': AppIcons.debt,
  },
  BillCategory.devices: {
    'string': 'Devices',
    'icon': AppIcons.devices,
  },
  BillCategory.education: {
    'string': 'Education',
    'icon': AppIcons.education,
  },
  BillCategory.electricity: {
    'string': 'Electricity',
    'icon': AppIcons.electricity,
  },
  BillCategory.entertainment: {
    'string': 'Entertainment',
    'icon': AppIcons.entertainment,
  },
  BillCategory.groceries: {
    'string': 'Groceries',
    'icon': AppIcons.groceries,
  },
  BillCategory.healthCare: {
    'string': 'Health care',
    'icon': AppIcons.healthCare,
  },
  BillCategory.internet: {
    'string': 'Internet',
    'icon': AppIcons.internet,
  },
  BillCategory.insurance: {
    'string': 'Insurance',
    'icon': AppIcons.insurance,
  },
  BillCategory.investment: {
    'string': 'Investment',
    'icon': AppIcons.investment,
  },
  BillCategory.miscellaneous: {
    'string': 'Miscellaneous',
    'icon': AppIcons.miscellaneous,
  },
  BillCategory.rent: {
    'string': 'Rent',
    'icon': AppIcons.rent,
  },
  BillCategory.transportation: {
    'string': 'Transportation',
    'icon': AppIcons.transportation,
  },
  BillCategory.travel: {
    'string': 'Travel',
    'icon': AppIcons.travel,
  },
  BillCategory.water: {
    'string': 'Water',
    'icon': AppIcons.water,
  },
};
