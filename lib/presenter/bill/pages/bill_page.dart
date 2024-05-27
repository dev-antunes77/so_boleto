// import 'package:flutter/material.dart';
// import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
// import 'package:so_boleto/presenter/bill/pages/sections/bill_category_section.dart';
// import 'package:so_boleto/presenter/bill/pages/sections/bill_check_section.dart';
// import 'package:so_boleto/presenter/bill/pages/sections/bill_description_section.dart';
// import 'package:so_boleto/presenter/bill/pages/sections/bill_due_day_of_the_month_section.dart';
// import 'package:so_boleto/presenter/bill/pages/sections/bill_name_section.dart';
// import 'package:so_boleto/presenter/bill/pages/sections/bill_parcel_section.dart';
// import 'package:so_boleto/presenter/bill/pages/sections/bill_value_section.dart';
// import 'package:so_boleto/presenter/bill/widgets/bill_background_card.dart';

// class BillPage extends StatefulWidget {
//   const BillPage({super.key});
//   @override
//   State<BillPage> createState() => _BillPageState();
// }

// class _BillPageState extends State<BillPage> with TickerProviderStateMixin {
//   PageController pageCtrl = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return BillBackgroundCard(
//       child: PageView.builder(
//         controller: pageCtrl,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           return _returnBillSection(index);
//         },
//       ),
//     );
//   }

//   Widget _returnBillSection(int index) {
//     switch (index) {
//       case 0:
//         return BillNameSection(pageCtrl);
//       case 1:
//         return BillDescriptionSection(pageCtrl);
//       case 2:
//         return BillParcelSection(pageCtrl);
//       case 3:
//         return BillValueSection(pageCtrl);
//       case 4:
//         return BillDueDayOfTheMonthSection(pageCtrl);
//       case 5:
//         return BillCategorySection(pageCtrl);
//       case 6:
//         return BillCheckSection(pageCtrl);
//     }
//     return const SizedBox.shrink();
//   }
// }
