import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/extensions/date_time_extensions.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';

class BillHistoryPage extends StatelessWidget {
  const BillHistoryPage(this.bill, {super.key});

  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    return BillShell(
        height: context.height * 0.8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppThemeValues.spaceLarge,
              ),
              child: Text(
                AppLocalizations.current.billHistoryTitle(bill.name.trim()),
                style: context.textRobotoSubtitleMediumToLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: bill.billPayment.length,
                separatorBuilder: (context, index) =>
                    LineSeparator.infiniteHorizon(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final payment = bill.billPayment[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppThemeValues.spaceHuge,
                      vertical: AppThemeValues.spaceSmall,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('MMMM yyyy')
                              .format(payment.referredMonth)
                              .capitalize(),
                          style: context.textRobotoMedium,
                        ),
                        if (payment.billStatus == BillStatus.payed)
                          Text(
                            AppLocalizations.current.billHistoryPaidAt(
                                payment.payedAt.substring(0, 5)),
                            style: context.textRobotoMedium,
                          )
                        else if (payment.referredMonth.currentMonthAndYear())
                          Text(
                            bill.dueDay.properDueDay(),
                            style: context.textRobotoMedium,
                          )
                        else
                          Text(
                            bill.dueDay
                                .properOldMonthsDelay(payment.referredMonth),
                            style: context.textRobotoMedium,
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
