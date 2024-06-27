import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/presenter/profile/widgets/animated_theme_switch.dart';

class ProfileThemeAppBar extends StatefulWidget {
  const ProfileThemeAppBar({super.key});

  @override
  State<ProfileThemeAppBar> createState() => _ProfileThemeAppBarState();
}

class _ProfileThemeAppBarState extends State<ProfileThemeAppBar> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return AppBar(
      flexibleSpace: BlocBuilder<ThemeCubit, ThemeState>(
        bloc: themeCubit,
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return AnimatedThemeSwitch(
            isLightTheme: state.isLightTheme,
            onSwitchTheme: themeCubit.onThemeChange,
          );
        },
      ),
      centerTitle: false,
      elevation: 12,
      bottomOpacity: 0.3,
      titleSpacing: 0.0,
    );
  }
}
