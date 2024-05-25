import 'package:flutter/material.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_category_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_description_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_due_day_of_the_month_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_name_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_parcel_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_value_section.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> with TickerProviderStateMixin {
  PageController pageCtrl = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageCtrl,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _returnBillSection(index);
      },
    );
  }

  Widget _returnBillSection(int index) {
    switch (index) {
      case 0:
        return BillNameSection(_navigateSection);
      case 1:
        return BillDescriptionSection(_navigateSection);
      case 2:
        return BillParcelSection(_navigateSection);
      case 3:
        return BillValueSection(_navigateSection);
      case 4:
        return BillDueDayOfTheMonthSection(_navigateSection);
      case 5:
        return BillCategorySection(_navigateSection);
    }
    return const SizedBox.shrink();
  }

  _navigateSection(bool moveNext) => moveNext
      ? pageCtrl.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.bounceIn)
      : pageCtrl.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.bounceIn);
}
