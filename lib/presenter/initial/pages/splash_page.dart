import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<InitialCubit>().onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocListener<InitialCubit, InitialState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == BaseStateStatus.success && state.user != null) {
              if (state.user!.hasSeenOnbording) {
                context.navigateTo(Routes.home);
              } else {
                context.navigateTo(Routes.onboarding);
              }
            }
            if (state.status == BaseStateStatus.success && state.user == null) {
              context.navigateTo(Routes.login);
            }
          },
          child: Center(
            child: CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Text(
                        AppLocalizations.current.appNameHalf1,
                        style: context.textSubtitleLarge
                            .copyWith(color: AppColors.white),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: AppThemeValues.spaceSmall),
                        child: SvgAsset(
                          svg: AppIcons.money,
                          height: 80,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppLocalizations.current.appNameHalf2,
                    style: context.textSubtitleHuge
                        .copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
