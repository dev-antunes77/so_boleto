import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/loading_page/full_page_loading.dart';
import 'package:so_boleto/core/components/loading_page/full_page_loading_stack.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/tabs/current_month_tab.dart';
import 'package:so_boleto/presenter/home/tabs/old_month_tab.dart';
import 'package:so_boleto/presenter/home/widgets/month_navigator.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late final PageController _pageController;
  late final HomeBillsCubit cubit;
  final _months = AppConstants.months;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    cubit = context.read<HomeBillsCubit>();
    final user = context.read<InitialCubit>().state.user;
    cubit.onInit(
      user!.id,
      user.billSorting,
      user.hasInvertedSorting,
    );
    _pageController = PageController(initialPage: _months.length - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FullPageLoadingStack(
      overlayBuilder: BlocConsumer<HomeBillsCubit, HomeBillsState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == BaseStateStatus.focusedError) {
            context.showSnackBar(state.callbackMessage);
          }
        },
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) => FullPageLoading(
          isLoading: state.status == BaseStateStatus.loading,
        ),
      ),
      child: CustomSafeArea(
        child: Column(
          children: [
            MonthNavigator(
              pageController: _pageController,
              months: _months,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _months.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == _months.length - 1) {
                    return CurrentMonthTab(tabController: _tabController);
                  }
                  final oldBills = cubit.state.getOldBills(_months[index]);
                  return OldMonthTab(
                    thisMonthBills: oldBills,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
