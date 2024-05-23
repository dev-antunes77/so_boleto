import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => context.navigateTo(Routes.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
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
                      'Só',
                      style: context.textSubtitleLarge
                          .copyWith(color: AppColors.white),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: AppThemeValues.spaceSmall),
                      child: SvgAsset(
                        svg: AppIcons.money,
                        height: 80,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Boleto',
                  style:
                      context.textSubtitleHuge.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
