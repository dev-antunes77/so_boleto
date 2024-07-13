import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/loading_page/full_page_loading.dart';
import 'package:so_boleto/core/components/loading_page/full_page_loading_stack.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/months.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/home_bill_tab.dart';
import 'package:so_boleto/presenter/home/widgets/tab_indicator.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late final PageController _pageController;

  List<DateTime> get _months {
    return List.generate(12, (index) {
      final currentDate = DateTime.now();
      return DateTime(currentDate.year, currentDate.month - (11 - index));
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    final cubit = context.read<HomeBillsCubit>();
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
                itemCount: Months.values.length,
                itemBuilder: (context, index) {
                  if (index == _months.length - 1) {
                    return Column(
                      children: [
                        LineSeparator.horizontalLimitedThick(
                          height: AppThemeValues.spaceXTiny,
                          width: double.infinity,
                          noPadding: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: AppThemeValues.spaceXXXSmall),
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
                                onError: () => const CustomStatusHandler(
                                    PageResponseHandler.error),
                                onState: (_) => TabBarView(
                                  controller: _tabController,
                                  children: [
                                    HomeBillTab(
                                      state.inFilteringCase(state.allBills),
                                      message: state.paramsApplied
                                          ? PageResponseHandler
                                              .noneForTheseFilters
                                          : PageResponseHandler.noneRegistered,
                                    ),
                                    HomeBillTab(
                                      state.inFilteringCase(state.payedBills),
                                      message: state.paramsApplied
                                          ? PageResponseHandler
                                              .noneForTheseFilters
                                          : PageResponseHandler.nonePayed,
                                    ),
                                    HomeBillTab(
                                      state.inFilteringCase(state.delayedBills),
                                      message: state.paramsApplied
                                          ? PageResponseHandler
                                              .noneForTheseFilters
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
                  return const Center(
                    child: Text('Teste'),
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

class MonthNavigator extends StatelessWidget {
  const MonthNavigator({
    super.key,
    required this.pageController,
    required this.months,
  });

  final PageController pageController;
  final List<DateTime> months;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBillsCubit, HomeBillsState, DateTime>(
      selector: (state) {
        return state.currentMonth;
      },
      builder: (context, month) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => _previousMonth(context, month),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
            Text(
              DateFormat('MMMM yyyy').format(month),
              style: context.textRobotoMediumToLarge,
            ),
            if (month == months.last)
              Row(
                children: [
                  Text(
                    'Contas\nFuturas',
                    style: context.textSmall,
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ],
              )
            else
              IconButton(
                onPressed: () => _nextMonth(context, month),
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              )
          ],
        );
      },
    );
  }

  void _previousMonth(BuildContext context, DateTime month) {
    final currentPage = pageController.page!.toInt();
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      final previousMonth = DateTime(month.year, month.month - 1);
      context.read<HomeBillsCubit>().onMonthCange(previousMonth);
    }
  }

  void _nextMonth(BuildContext context, DateTime month) {
    final currentPage = pageController.page!.toInt();
    if (currentPage < months.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      final nextMonth = DateTime(month.year, month.month + 1);
      context.read<HomeBillsCubit>().onMonthCange(nextMonth);
    }
  }
}
