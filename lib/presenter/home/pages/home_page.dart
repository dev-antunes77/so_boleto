import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/loading_page/loading_page.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/home_bill_tab.dart';
import 'package:so_boleto/presenter/home/widgets/tab_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    final cubit = context.read<HomeBillsCubit>();
    if (cubit.state.bills.isEmpty) {
      cubit.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: AppThemeValues.spaceSmall),
            child: TabBar(
              controller: _tabController,
              tabs: [
                TabIndicator(AppLocalizations.current.homeTabAll),
                TabIndicator(AppLocalizations.current.homeTabPayed),
                TabIndicator(AppLocalizations.current.homeTabDelayed),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<HomeBillsCubit, HomeBillsState>(
              listener: (context, state) {
                if (state.status == BaseStateStatus.focusedError) {
                  context.showSnackBar(state.callbackMessage);
                }
              },
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) => state.when(
                onLoading: () => const LoadingPage3(),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
