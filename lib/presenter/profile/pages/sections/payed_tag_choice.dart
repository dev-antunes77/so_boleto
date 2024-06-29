import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_payed_tag/payed_tag_selector.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';

class PayedTagChoice extends StatelessWidget {
  const PayedTagChoice({super.key});

  @override
  Widget build(BuildContext context) {
    final tagChoiceBill = BillModel(
      name: 'Exemplo',
      value: 0,
      userId: '',
      billStatus: BillStatus.payed,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Selecione a tag de pagamento que melhor se adapte a você'),
          AppThemeValues.spaceVerticalMedium,
          const Text('Carimbo'),
          BillListTile(
            tagChoiceBill,
            payedTagSelector: PayedTagSelector(
              tagChoiceBill.billStatus.isPayed,
              payedTag: PayedTag.stample,
            ),
            isTagPreferenceScreen: true,
          ),
          AppThemeValues.spaceVerticalMedium,
          const Text('Check na borda'),
          BillListTile(
            tagChoiceBill,
            payedTagSelector: PayedTagSelector(
              tagChoiceBill.billStatus.isPayed,
              payedTag: PayedTag.check,
            ),
            isTagPreferenceScreen: true,
          ),
          AppThemeValues.spaceVerticalMedium,
          const Text('Barra lateral'),
          BillListTile(
            tagChoiceBill,
            payedTagSelector: PayedTagSelector(
              tagChoiceBill.billStatus.isPayed,
              payedTag: PayedTag.sideBar,
            ),
            isTagPreferenceScreen: true,
          ),
          AppThemeValues.spaceVerticalMedium,
          const Text('Barra inferior'),
          BillListTile(
            tagChoiceBill,
            payedTagSelector: PayedTagSelector(
              tagChoiceBill.billStatus.isPayed,
              payedTag: PayedTag.bottomBar,
            ),
            isTagPreferenceScreen: true,
          ),
        ],
      ),
    );
  }
}
