import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum BillCategory {
  automobile({
    'text': 'Automobile',
    'icon': AppIcons.automobile,
  }),
  communication({
    'text': 'Communication',
    'icon': AppIcons.phone,
  }),
  creditCard({
    'text': 'Credit card',
    'icon': AppIcons.creditCard,
  }),
  debt({
    'text': 'Debt',
    'icon': AppIcons.debt,
  }),
  devices({
    'text': 'Devices',
    'icon': AppIcons.devices,
  }),
  education({
    'text': 'Education',
    'icon': AppIcons.education,
  }),
  electricity({
    'text': 'Electricity',
    'icon': AppIcons.electricity,
  }),
  entertainment({
    'text': 'Entertainment',
    'icon': AppIcons.entertainment,
  }),
  groceries({
    'text': 'Groceries',
    'icon': AppIcons.groceries,
  }),
  gas({
    'text': 'Gas',
    'icon': AppIcons.gas,
  }),
  healthCare({
    'text': 'Health care',
    'icon': AppIcons.healthCare,
  }),
  insurance({
    'text': 'Insurance',
    'icon': AppIcons.insurance,
  }),
  investment({
    'text': 'Investment',
    'icon': AppIcons.investment,
  }),
  internet({
    'text': 'Internet',
    'icon': AppIcons.internet,
  }),
  miscellaneous({
    'text': 'Miscellaneous',
    'icon': AppIcons.miscellaneous,
  }),
  rent({
    'text': 'Rent',
    'icon': AppIcons.rent,
  }),
  petShop({
    'text': 'Pet shop',
    'icon': AppIcons.petShop,
  }),
  transportation({
    'text': 'Transportation',
    'icon': AppIcons.transportation,
  }),
  travel({
    'text': 'Travel',
    'icon': AppIcons.travel,
  }),
  water({
    'text': 'Water',
    'icon': AppIcons.water,
  });

  const BillCategory(this.value);
  final Map<String, dynamic> value;

  static List<String> get categoryList {
    List<String> list = [];
    for (var element in BillCategory.values) {
      list.add(element.value['text']);
    }
    return list;
  }
}

// List<String> get categoryList {
//   List<String> list = [];
//   for (var element in categoryMap.entries) {
//     list.add(element.value['string']);
//   }
//   return list;
// }

// Map<BillCategory, dynamic> categoryMap = {
//   BillCategory.automobile: {
//     'string': 'Automobile',
//     'icon': AppIcons.automobile,
//   },
//   BillCategory.communication: {
//     'string': 'Communication',
//     'icon': AppIcons.phone,
//   },
//   BillCategory.creditCard: {
//     'string': 'Credit card',
//     'icon': AppIcons.creditCard,
//   },
//   BillCategory.debt: {
//     'string': 'Debt',
//     'icon': AppIcons.debt,
//   },
//   BillCategory.devices: {
//     'string': 'Devices',
//     'icon': AppIcons.devices,
//   },
//   BillCategory.education: {
//     'string': 'Education',
//     'icon': AppIcons.education,
//   },
//   BillCategory.electricity: {
//     'string': 'Electricity',
//     'icon': AppIcons.electricity,
//   },
//   BillCategory.entertainment: {
//     'string': 'Entertainment',
//     'icon': AppIcons.entertainment,
//   },
//   BillCategory.groceries: {
//     'string': 'Groceries',
//     'icon': AppIcons.groceries,
//   },
//   BillCategory.healthCare: {
//     'string': 'Health care',
//     'icon': AppIcons.healthCare,
//   },
//   BillCategory.internet: {
//     'string': 'Internet',
//     'icon': AppIcons.internet,
//   },
//   BillCategory.insurance: {
//     'string': 'Insurance',
//     'icon': AppIcons.insurance,
//   },
//   BillCategory.investment: {
//     'string': 'Investment',
//     'icon': AppIcons.investment,
//   },
//   BillCategory.miscellaneous: {
//     'string': 'Miscellaneous',
//     'icon': AppIcons.miscellaneous,
//   },
//   BillCategory.rent: {
//     'string': 'Rent',
//     'icon': AppIcons.rent,
//   },
//   BillCategory.transportation: {
//     'string': 'Transportation',
//     'icon': AppIcons.transportation,
//   },
//   BillCategory.travel: {
//     'string': 'Travel',
//     'icon': AppIcons.travel,
//   },
//   BillCategory.water: {
//     'string': 'Water',
//     'icon': AppIcons.water,
//   },
// };
