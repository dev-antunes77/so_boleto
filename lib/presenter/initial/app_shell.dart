// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/bottom_navigator_page.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/widgets/custom_bottom_navigator.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/status_page/widgets/shimmer.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
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
        leaveTheApp: true,
        child: Scaffold(
          appBar: customAppBar(
            context: context,
            title: 'Example',
            actions: [
              IconButton(
                onPressed: () => context.navigateTo(Routes.billName),
                icon: const SvgAsset(
                  svg: AppIcons.search,
                  height: 32,
                  color: AppColors.primary,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const SvgAsset(
                  svg: AppIcons.add,
                  height: 32,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppThemeValues.spaceXXSmall),
            child: Shimmer(child: widget.child),
          ),
          extendBody: true,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: BlocBuilder<InitialCubit, InitialState>(
            builder: (context, state) => Shimmer(
              child: CustomBottomNavigator(
                currentScreen: state.currentPage.value,
                onChangePage: _onChangePage,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onChangePage(int index) {
    final cubit = context.read<InitialCubit>();
    cubit.onChangePage(BottomNavigatorPage.fromIndex(index));
    context.navigateTo(BottomNavigatorPage.getRoute(cubit.state.currentPage));
  }
}
