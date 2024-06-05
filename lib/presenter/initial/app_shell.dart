// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/bottom_navigator_page.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/widgets/custom_bottom_navigator.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/status_page/widgets/shimmer.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_flow_app_bar.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/home_app_bar.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

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
            preferredSize:
                const Size(double.infinity, AppThemeValues.spaceEnormous),
            child: context.currentRoute == Routes.home
                ? const HomeAppBar()
                : context.currentRoute.contains('bill')
                    ? const BillFlowAppBar()
                    : const SizedBox.shrink(),
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

  void _onChangePage(int index) {
    final cubit = context.read<InitialCubit>();
    cubit.onChangePage(BottomNavigatorPage.fromIndex(index));
    context.read<HomeBillsCubit>().setSearchByNameValue('');
    context.navigateTo(BottomNavigatorPage.getRoute(cubit.state.currentPage));
  }
}
