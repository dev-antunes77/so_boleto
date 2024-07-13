import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/tabs/home_bill_tab.dart';
import 'package:so_boleto/presenter/home/widgets/tab_indicator.dart';

class CurrentMonthTab extends StatelessWidget {
  const CurrentMonthTab({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LineSeparator.horizontalLimitedThick(
          height: AppThemeValues.spaceXTiny,
          width: double.infinity,
          noPadding: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppThemeValues.spaceXXXSmall),
          child: TabBar(
            indicatorPadding: const EdgeInsets.only(
              top: AppThemeValues.spaceSmall,
            ),
            controller: _tabController,
            labelPadding: const EdgeInsets.symmetric(
                horizontal: AppThemeValues.spaceXXXSmall),
            tabs: [
              TabIndicator(
                AppLocalizations.current.homeTabAll,
              ),
              TabIndicator(
                AppLocalizations.current.homeTabPayed,
              ),
              TabIndicator(
                AppLocalizations.current.homeTabDelayed,
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<HomeBillsCubit, HomeBillsState>(
            builder: (context, state) {
              if (state.status == BaseStateStatus.loading &&
                  state.bills.isEmpty) {
                return const SizedBox.shrink();
              }
              return state.when(
                onError: () =>
                    const CustomStatusHandler(PageResponseHandler.error),
                onState: (_) => TabBarView(
                  controller: _tabController,
                  children: [
                    HomeBillTab(
                      state.inFilteringCase(state.allBills),
                      message: state.paramsApplied
                          ? PageResponseHandler.noneForTheseFilters
                          : PageResponseHandler.noneRegistered,
                    ),
                    HomeBillTab(
                      state.inFilteringCase(state.payedBills),
                      message: state.paramsApplied
                          ? PageResponseHandler.noneForTheseFilters
                          : PageResponseHandler.nonePayed,
                    ),
                    HomeBillTab(
                      state.inFilteringCase(state.delayedBills),
                      message: state.paramsApplied
                          ? PageResponseHandler.noneForTheseFilters
                          : PageResponseHandler.noneDelayed,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
