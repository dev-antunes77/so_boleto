import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/tabs/home_bill_tab.dart';
import 'package:so_boleto/presenter/home/tabs/home_bill_tab_titles.dart';
import 'package:so_boleto/presenter/home/widgets/month_navigator.dart';

class HomePagePast extends StatefulWidget {
  const HomePagePast({super.key});

  @override
  State<HomePagePast> createState() => _HomePagePastState();
}

class _HomePagePastState extends State<HomePagePast>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late final PageController _pageController;
  final _months = AppConstants.pastMonths;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: _months.length - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MonthNavigator(
          pageController: _pageController,
          months: _months,
        ),
        LineSeparator.horizontalLimitedThick(
          height: AppThemeValues.spaceXTiny,
          width: double.infinity,
          noPadding: true,
        ),
        HomeBillTabTitles(tabController: _tabController),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _months.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return BlocBuilder<HomeBillsCubit, HomeBillsState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  final oldBills = state.getOldBills(_months[index]);
                  final oldPayedBills = state.getPayedOldBills(_months[index]);
                  final oldDelayedBills =
                      state.getDelayedOldBills(_months[index]);

                  return TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      HomeBillTab(
                        state.inFilteringCase(oldBills),
                        isOldMonthTab: true,
                        month: _months[index],
                        message: state.paramsApplied
                            ? PageResponseHandler.noneForTheseFilters
                            : PageResponseHandler.noneThatOld,
                      ),
                      HomeBillTab(
                        state.inFilteringCase(oldPayedBills),
                        isOldMonthTab: true,
                        month: _months[index],
                        message: state.paramsApplied
                            ? PageResponseHandler.noneForTheseFilters
                            : oldBills.isEmpty
                                ? PageResponseHandler.noneThatOld
                                : PageResponseHandler.nonePayed,
                      ),
                      HomeBillTab(
                        state.inFilteringCase(oldDelayedBills),
                        isOldMonthTab: true,
                        month: _months[index],
                        message: state.paramsApplied
                            ? PageResponseHandler.noneForTheseFilters
                            : oldBills.isEmpty
                                ? PageResponseHandler.noneThatOld
                                : PageResponseHandler.noneDelayed,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
