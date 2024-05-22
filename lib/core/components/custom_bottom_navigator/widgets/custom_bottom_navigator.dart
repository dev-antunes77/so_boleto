import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/widgets/bottom_navigator_item.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/presenter/home/cubit/bill_cubit.dart';

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
        BlocBuilder<BillCubit, BillState>(
          buildWhen: (previous, current) => true,
          builder: (context, state) {
            return const SizedBox.shrink();
            //Visibility(
            //   visible: state.radio.id != 0,
            //   child: const BottomPlayer(),
            // );
          },
        ),
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
            unselectedLabelStyle: context.textRobotoSubtitleTiny,
            items: [
              buildBottomNavigationBarItem(
                'Your payments',
                AppIcons.payment,
              ),
              // buildBottomNavigationBarItem(
              //   AppLocalizations.current.favoriteRadios,
              //   AppIcons.heartEmpty,
              // ),
              buildBottomNavigationBarItem(
                'Perfil',
                // AppLocalizations.current.profile,
                AppIcons.person,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
