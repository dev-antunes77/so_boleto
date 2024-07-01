import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/loading_page/loading_page.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
import 'package:so_boleto/presenter/profile/widgets/animated_theme_switch.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_title_sections.dart';

class ThemeChoice extends StatefulWidget {
  const ThemeChoice({super.key});

  @override
  State<ThemeChoice> createState() => _ThemeChoiceState();

  static const List<Color> themeColors = [
    Color.fromARGB(255, 4, 136, 59),
    Color.fromARGB(255, 251, 139, 35),
    Color.fromARGB(255, 15, 82, 186),
    Colors.red,
    Colors.deepPurple,
    Color.fromARGB(255, 0, 154, 166),
  ];
}

class _ThemeChoiceState extends State<ThemeChoice> {
  late final ThemeCubit themeCubit;

  @override
  void initState() {
    themeCubit = context.read<ThemeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {
        if (state.status == BaseStateStatus.generalError) {
          context.showSnackBar(state.callbackMessage);
        }
      },
      bloc: themeCubit,
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == BaseStateStatus.loading) {
          return const Center(child: LoadingPage());
        }
        return Column(
          children: [
            SizedBox(
              height: context.height * 0.25,
              child: AnimatedThemeSwitch(
                isLightTheme: state.isLightTheme,
                onSwitchTheme: (value) =>
                    _onSwitchTheme(value, state.selectedColors.baseColor),
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
                    itemCount: ThemeChoice.themeColors.length,
                    itemBuilder: (context, index) {
                      final color = ThemeChoice.themeColors[index];
                      return GestureDetector(
                        onTap: () => _onSwitchColor(state.isLightTheme, color),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              AppThemeValues.spaceXXXSmall),
                          child: Opacity(
                            opacity: state.isLightTheme ? 1 : 0.7,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: color,
                                border: color == state.selectedColors.baseColor
                                    ? Border.all(
                                        width: 5,
                                        color: state.selectedColors.text,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: color == state.selectedColors.baseColor
                                  ? const Icon(
                                      Icons.check,
                                      color: AppColors.white,
                                      size: 24,
                                    )
                                  : null,
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

  void _onSwitchTheme(bool hasLightTheme, Color baseColor) {
    themeCubit.onThemeChange(hasLightTheme);
    context
        .read<InitialCubit>()
        .onUpdateUserThemeColors(baseColor, hasLightTheme);
  }

  void _onSwitchColor(bool hasLightTheme, Color baseColor) {
    themeCubit.onChangeColor(baseColor);
    context
        .read<InitialCubit>()
        .onUpdateUserThemeColors(baseColor, hasLightTheme);
  }
}
