import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/status_page/pages/loading_page.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/home_bill_tab.dart';

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
              // labelStyle: context.textMedium.copyWith(
              //   fontWeight: FontWeight.bold,
              //   color: AppColors.backgroundDark.withOpacity(0.4),
              // ),
              // overlayColor:
              //     const WidgetStatePropertyAll<Color>(Colors.transparent),
              // indicator: BoxDecoration(
              //   color: AppColors.primary.withOpacity(0.2),
              //   borderRadius: const BorderRadius.all(Radius.circular(25)),
              // ),
              // indicatorPadding: EdgeInsets.zero,
              // dividerColor: Colors.transparent,
              // // indicatorColor: Colors.transparent,
              // labelPadding: const EdgeInsets.symmetric(
              //     horizontal: AppThemeValues.spaceSmall),
              // unselectedLabelStyle: context.textSmall,
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
                  return const LoadingPage();
                }
                return TabBarView(
                  controller: _tabController,
                  children: [
                    HomeBillTab(state.bills),
                    HomeBillTab(state.payedBills),
                    HomeBillTab(state.delayeddBills),
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

class TabIndicator extends StatelessWidget {
  const TabIndicator(this.label, {super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppThemeValues.spaceXLarge,
      width: double.infinity,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(label),
      ),
    );
  }
}
