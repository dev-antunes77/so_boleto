import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/tabs/home_bill_tab.dart';

class OldMonthTab extends StatelessWidget {
  const OldMonthTab({
    super.key,
    required this.oldMonth,
  });

  final DateTime oldMonth;

  @override
  Widget build(BuildContext context) {
    final thisMonthBills = context
        .read<HomeBillsCubit>()
        .state
        .allBills
        .where((bill) => oldMonth.month > bill.createdAt.month)
        .toList();

    return Column(
      children: [
        LineSeparator.horizontalLimitedThick(
          height: AppThemeValues.spaceXTiny,
          width: double.infinity,
          noPadding: true,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppThemeValues.spaceXXXSmall,
            left: AppThemeValues.spaceSmall,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.current.homeTabAll,
              style: context.textSmall.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<HomeBillsCubit, HomeBillsState>(
            builder: (context, state) {
              if (state.status == BaseStateStatus.loading &&
                  thisMonthBills.isEmpty) {
                return const SizedBox.shrink();
              }
              return state.when(
                onError: () =>
                    const CustomStatusHandler(PageResponseHandler.error),
                onState: (_) => HomeBillTab(
                  state.inFilteringCase(thisMonthBills),
                  isOldMonthTab: true,
                  message: state.paramsApplied
                      ? PageResponseHandler.noneForTheseFilters
                      : PageResponseHandler.noneForThisMonth,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
