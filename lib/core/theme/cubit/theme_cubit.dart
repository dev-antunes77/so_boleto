import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_state.dart';

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
    emit(state.copyWith(status: BaseStateStatus.success, isLighttheme: value));
  }
}
