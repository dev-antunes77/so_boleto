import 'package:flutter/material.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/bill_payment.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/presenter/profile/widgets/payment_tag_choice.dart';

class PayedTagChoice extends StatelessWidget {
  const PayedTagChoice({super.key});

  @override
  Widget build(BuildContext context) {
    final tagChoiceBill = BillModel(
        name: AppLocalizations.current.profilePayedTagExample,
        value: 0,
        userId: '',
        billPayment: [BillPayment(billStatus: BillStatus.payed)]);

    List<PaymentTagChoiceTile> paymentTagOptions = [
      PaymentTagChoiceTile(
        tagChoiceBill: tagChoiceBill,
        label: AppLocalizations.current.profilePayedTagStaple,
        tag: PayedTag.stample,
      ),
      PaymentTagChoiceTile(
        tagChoiceBill: tagChoiceBill,
        label: AppLocalizations.current.profilePayedTagCheck,
        tag: PayedTag.check,
      ),
      PaymentTagChoiceTile(
        tagChoiceBill: tagChoiceBill,
        label: AppLocalizations.current.profilePayedTagSideBar,
        tag: PayedTag.sideBar,
      ),
      PaymentTagChoiceTile(
        tagChoiceBill: tagChoiceBill,
        label: AppLocalizations.current.profilePayedTagBottomBar,
        tag: PayedTag.bottomBar,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(
            AppThemeValues.spaceXSmall,
          ),
          child: Text(
            AppLocalizations.current.profilePayedTagTitle,
            style: context.textRobotoSubtitleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        AppThemeValues.spaceVerticalMedium,
        ListView.separated(
          itemCount: paymentTagOptions.length,
          separatorBuilder: (context, index) =>
              AppThemeValues.spaceVerticalMassive,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => paymentTagOptions[index],
        )
      ],
    );
  }
}
