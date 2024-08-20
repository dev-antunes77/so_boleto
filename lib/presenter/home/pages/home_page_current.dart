import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/loading_page/full_page_loading.dart';
import 'package:so_boleto/core/components/loading_page/full_page_loading_stack.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/tabs/home_bill_tab.dart';
import 'package:so_boleto/presenter/home/tabs/home_bill_tab_titles.dart';
import 'package:so_boleto/presenter/home/widgets/home_navigator_button.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class HomePageCurrent extends StatefulWidget {
  const HomePageCurrent({super.key});

  @override
  State<HomePageCurrent> createState() => _HomePageCurrentState();
}

class _HomePageCurrentState extends State<HomePageCurrent>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late final HomeBillsCubit cubit;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: FullPageLoadingStack(
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeNavigatorButton(
                  isFuture: false,
                  onTap: _onOldBillsNavigation,
                ),
                Text(
                  DateFormat('MMMM yyyy')
                      .format(AppConstants.currentDate)
                      .capitalize(),
                  style: context.textRobotoMediumToLarge,
                ),
                HomeNavigatorButton(
                  isFuture: true,
                  onTap: () => context.pushTo(
                    Routes.homeFuture,
                  ),
                ),
              ],
            ),
            LineSeparator.horizontalLimitedThick(
              height: AppThemeValues.spaceXTiny,
              width: double.infinity,
              noPadding: true,
            ),
            HomeBillTabTitles(tabController: _tabController),
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
                      physics: const NeverScrollableScrollPhysics(),
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
        ),
      ),
    );
  }

  void _onOldBillsNavigation() {
    final previousMonth = DateTime(
        AppConstants.currentDate.year, AppConstants.currentDate.month - 1);
    context.read<HomeBillsCubit>().onMonthCange(previousMonth);
    context.pushTo(Routes.homePast);
  }
}
