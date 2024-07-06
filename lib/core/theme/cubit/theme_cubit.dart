import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/theme_colors.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/user_data.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(status: BaseStateStatus.initial),
        );

  void onInit(UserData user) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final newColorTheme = user.hasLightTheme
        ? ThemeColors.light(user.baseColor)
        : ThemeColors.dark(user.baseColor);
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        isLightTheme: user.hasLightTheme,
        selectedColors: newColorTheme,
      ),
    );
  }

  void onThemeChange(bool value) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final newColorTheme = value
        ? ThemeColors.light(state.selectedColors.baseColor)
        : ThemeColors.dark(state.selectedColors.baseColor);

    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        isLightTheme: value,
        selectedColors: newColorTheme,
      ),
    );
  }

  void onChangeColor(Color color) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final newColorTheme =
        state.isLightTheme ? ThemeColors.light(color) : ThemeColors.dark(color);
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        selectedColors: newColorTheme,
      ),
    );
  }
}
