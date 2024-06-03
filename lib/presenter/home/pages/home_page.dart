import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/custom_state_handler/custom_state_handler.dart';
import 'package:so_boleto/core/components/status_page/pages/loading_page.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/page_handler.dart';
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
      cubit.getBills();
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
              tabs: const [
                TabIndicator('Todas'),
                TabIndicator('Pagas'),
                TabIndicator('Atrasadas'),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeBillsCubit, HomeBillsState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                if (state.status == BaseStateStatus.loading) {
                  return const LoadingPage3();
                }
                if (state.status == BaseStateStatus.error) {
                  return const CustomStateHandler(PageResponseHandler.error);
                }
                return TabBarView(
                  controller: _tabController,
                  children: [
                    HomeBillTab(
                      state.inFilteringCase(state.allBills),
                      message: state.paramsApplied
                          ? PageResponseHandler.noneForTheseFilters
                          : PageResponseHandler.noneAdded,
                    ),
                    HomeBillTab(
                      state.inFilteringCase(state.payedBills),
                      message: state.paramsApplied
                          ? PageResponseHandler.noneForTheseFilters
                          : PageResponseHandler.nonePayed,
                    ),
                    HomeBillTab(
                      state.inFilteringCase(state.delayeddBills),
                      message: state.paramsApplied
                          ? PageResponseHandler.noneForTheseFilters
                          : PageResponseHandler.noneDelayed,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
