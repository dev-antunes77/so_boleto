// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/bottom_navigator_page.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/widgets/custom_bottom_navigator.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/status_page/widgets/shimmer.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/utils/bottom_sheet_utils.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_search_bar.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
import 'package:so_boleto/presenter/initial/widgets/appbar_title.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialCubit, InitialState>(
      buildWhen: (previous, current) =>
          previous.currentPage != current.currentPage,
      builder: (context, state) => CustomPopScope(
        leaveTheApp: _showBottomNav(),
        leaveBillCreation: context.currentRoute.contains('bill'),
        child: Scaffold(
          backgroundColor: AppColors.primaryBackground,
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 40),
            child: CustomAppBar(
              title: AppBarTitle(context.currentRoute),
              leadingBackButton:
                  _hidBackButton() ? null : const CustomBackButton(),
              actions: context.currentRoute == Routes.home
                  ? [
                      const BillSearchBar(),
                      ActionButton(
                        icon: AppIcons.add,
                        onTap: () => _onCreateBillPressed(),
                      ),
                      BlocBuilder<HomeBillsCubit, HomeBillsState>(
                        builder: (context, state) {
                          return ActionButton(
                            icon: state.paramsApplied
                                ? AppIcons.filterApplied
                                : AppIcons.filter,
                            onTap: () => _onFilterPressed(context),
                          );
                        },
                      )
                    ]
                  : [],
            ),
          ),
          body: Shimmer(child: widget.child),
          extendBody: true,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: _showBottomNav()
              ? BlocBuilder<InitialCubit, InitialState>(
                  builder: (context, state) => Shimmer(
                    child: CustomBottomNavigator(
                      currentScreen: state.currentPage.value,
                      onChangePage: _onChangePage,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  bool _showBottomNav() =>
      context.currentRoute == Routes.home ||
      context.currentRoute == Routes.profile ||
      context.currentRoute == Routes.expenses;

  bool _hidBackButton() =>
      _showBottomNav() ||
      context.currentRoute != Routes.billName ||
      context.currentRoute != Routes.filter;

  void _onChangePage(int index) {
    final cubit = context.read<InitialCubit>();
    cubit.onChangePage(BottomNavigatorPage.fromIndex(index));
    context.read<HomeBillsCubit>().setSearchByNameValue('');
    context.navigateTo(BottomNavigatorPage.getRoute(cubit.state.currentPage));
  }

  void _onCreateBillPressed() {
    context.pushTo(
      Routes.billName,
      params: AppConstants.transitionScale,
    );
    context.read<HomeBillsCubit>().setSearchByNameValue('');
    context.read<BillCubit>().initiateCreationFlow();
  }

  void _onFilterPressed(BuildContext context) {
    showFilterBottomSheet(context);
    context.read<HomeBillsCubit>().setSearchByNameValue('');
  }
}
