import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/widgets/bottom_navigator_item.dart';
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
                'Your bills',
                AppIcons.coins,
              ),
              buildBottomNavigationBarItem(
                'Gastos',
                // AppLocalizations.current.favoriteRadios,
                AppIcons.expense,
              ),
              buildBottomNavigationBarItem(
                'Perfil',
                // AppLocalizations.current.profile,
                AppIcons.profile,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
