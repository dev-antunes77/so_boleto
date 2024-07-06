import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/widgets/bottom_navigator_item.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({
    super.key,
    required this.currentScreen,
    required this.onChangePage,
  });

  final int currentScreen;
  final Function(int) onChangePage;

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.selectedColors.icon;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox.shrink(),
        DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: AppColors.shadow,
              ),
            ],
          ),
          child: BottomNavigationBar(
            onTap: onChangePage,
            currentIndex: currentScreen,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: context.textRobotoSubtitleTiny,
            iconSize: 30,
            unselectedLabelStyle: context.textRobotoSubtitleTiny,
            items: [
              buildBottomNavigationBarItem(
                AppLocalizations.current.homeAppBarTitle,
                AppIcons.yourBills,
                color,
              ),
              buildBottomNavigationBarItem(
                AppLocalizations.current.expenses,
                AppIcons.expense,
                color,
              ),
              buildBottomNavigationBarItem(
                AppLocalizations.current.profile,
                AppIcons.profile,
                color,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
