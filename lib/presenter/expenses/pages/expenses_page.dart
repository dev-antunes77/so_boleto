import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/expenses/cubit/expenses_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage>
    with TickerProviderStateMixin {
  late final ExpensesCubit cubit;
  late final AnimationController _countController;
  late final Animation<int> _countAnimation;
  @override
  void initState() {
    cubit = context.read<ExpensesCubit>();
    cubit.onInit(context.read<HomeBillsCubit>().state.totalExpenses);
    _countController = _initCountingAnimationController();
    _countAnimation = _initTweenAnimation(cubit.state.totalExpenses);
    _countController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SvgAsset(
              svg: AppIcons.payment,
              height: 135,
            ),
            AppThemeValues.spaceVerticalLarge,
            AnimatedBuilder(
              animation: _countController,
              builder: (context, child) {
                return Text(
                  _countAnimation.value.toDouble().formatCurrency(),
                  style: context.textLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  AnimationController _initCountingAnimationController() => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2600),
      );

  Animation<int> _initTweenAnimation(int value) =>
      IntTween(begin: 0, end: value).animate(
        CurvedAnimation(
          parent: _countController,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      )..addListener(() => setState(() {}));
}
