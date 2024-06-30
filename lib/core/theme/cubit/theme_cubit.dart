import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/theme_colors.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(status: BaseStateStatus.initial),
        );

  void onInit() {
    emit(state.copyWith(status: BaseStateStatus.loading));
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
