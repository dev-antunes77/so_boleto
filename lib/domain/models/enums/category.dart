import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum Category {
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

Map<Category, dynamic> categoryMap = {
  Category.automobile: {
    'string': 'Automobile',
    'icon': AppIcons.automobile,
  },
  Category.communication: {
    'string': 'Communication',
    'icon': AppIcons.phone,
  },
  Category.creditCard: {
    'string': 'Credit card',
    'icon': AppIcons.creditCard,
  },
  Category.debt: {
    'string': 'Debt',
    'icon': AppIcons.debt,
  },
  Category.devices: {
    'string': 'Devices',
    'icon': AppIcons.devices,
  },
  Category.education: {
    'string': 'Education',
    'icon': AppIcons.education,
  },
  Category.electricity: {
    'string': 'Electricity',
    'icon': AppIcons.electricity,
  },
  Category.entertainment: {
    'string': 'Entertainment',
    'icon': AppIcons.entertainment,
  },
  Category.groceries: {
    'string': 'Groceries',
    'icon': AppIcons.groceries,
  },
  Category.healthCare: {
    'string': 'Health care',
    'icon': AppIcons.healthCare,
  },
  Category.internet: {
    'string': 'Internet',
    'icon': AppIcons.internet,
  },
  Category.insurance: {
    'string': 'Insurance',
    'icon': AppIcons.insurance,
  },
  Category.investment: {
    'string': 'Investment',
    'icon': AppIcons.investment,
  },
  Category.miscellaneous: {
    'string': 'Miscellaneous',
    'icon': AppIcons.miscellaneous,
  },
  Category.rent: {
    'string': 'Rent',
    'icon': AppIcons.rent,
  },
  Category.transportation: {
    'string': 'Transportation',
    'icon': AppIcons.transportation,
  },
  Category.travel: {
    'string': 'Travel',
    'icon': AppIcons.travel,
  },
  Category.water: {
    'string': 'Water',
    'icon': AppIcons.water,
  },
};
