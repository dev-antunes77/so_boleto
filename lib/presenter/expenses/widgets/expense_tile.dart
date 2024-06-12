import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class ExpensesTile extends StatefulWidget {
  const ExpensesTile({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final int value;

  @override
  State<ExpensesTile> createState() => _ExpensesTileState();
}

class _ExpensesTileState extends State<ExpensesTile>
    with TickerProviderStateMixin {
  late final AnimationController _countController;
  late final Animation<int> _countAnimation;
  @override
  void initState() {
    _countController = _initCountingAnimationController();
    _countAnimation = _initTweenAnimation(widget.value);
    _countController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(
          top: AppThemeValues.spaceMedium,
        ),
        child: SvgAsset(
          svg: AppIcons.coins,
          height: 54,
          color: AppColors.primaryDark,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppThemeValues.spaceVerticalLarge,
          Text(
            widget.label,
            style: context.textRobotoSubtitleMedium,
          ),
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
    );
  }

  AnimationController _initCountingAnimationController() => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2250),
      );

  Animation<int> _initTweenAnimation(int value) =>
      IntTween(begin: 0, end: value).animate(
        CurvedAnimation(
          parent: _countController,
          curve: Curves.fastEaseInToSlowEaseOut,
        ),
      )..addListener(() => setState(() {}));
}
