import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/profile/widgets/animated_theme_switch.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_title_sections.dart';

class ThemeChoice extends StatefulWidget {
  const ThemeChoice({super.key});

  @override
  State<ThemeChoice> createState() => _ThemeChoiceState();
}

class _ThemeChoiceState extends State<ThemeChoice> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: themeCubit,
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: context.height * 0.25,
              child: AnimatedThemeSwitch(
                isLightTheme: state.isLightTheme,
                onSwitchTheme: themeCubit.onThemeChange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppThemeValues.spaceLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileTitleSection('Cor do tema'),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: AppThemeValues.spaceSmall,
                      mainAxisSpacing: AppThemeValues.spaceSmall,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: themeColors.length,
                    itemBuilder: (context, index) {
                      final color = themeColors[index];
                      return GestureDetector(
                        onTap: () => themeCubit.onChangeColor(color),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              AppThemeValues.spaceXXXSmall),
                          child: Opacity(
                            opacity: state.isLightTheme ? 1 : 0.7,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  static const List<Color> themeColors = [
    Colors.teal,
    Colors.amber,
    Colors.blueAccent,
    Colors.red,
    Colors.deepPurple,
    Colors.limeAccent,
  ];
}
