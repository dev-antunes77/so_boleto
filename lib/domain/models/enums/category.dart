import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum Category {
  automobile,
  communication,
  creditCard,
  debt,
  education,
  entertainment,
  groceries,
  healthCare,
  insurance,
  investment,
  miscellaneous,
  rent,
  transportation,
  travel,
}

List<String> categoryList = [
  'Automobile',
  'Communication',
  'Credit card',
  'Debt',
  'Education',
  'Entertainment',
  'Groceries',
  'Health care',
  'Insurance',
  'Investment',
  'Miscellaneous',
  'Rent',
  'Transportation',
  'Travel',
];

Map<Category, dynamic> categoryMap = {
  Category.automobile: {
    'string': 'Automobile',
    'icon': AppIcons.automobile,
  },
  Category.communication: {
    'string': 'Communication',
    'icon': AppIcons.communication,
  },
  Category.creditCard: {
    'string': 'Credit card',
    'icon': AppIcons.creditCard,
  },
  Category.debt: {
    'string': 'Debt',
    'icon': AppIcons.debt,
  },
  Category.education: {
    'string': 'Education',
    'icon': AppIcons.education,
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
    'enum': Category.travel,
    'string': 'Travel',
    'icon': AppIcons.travel,
  },
};
