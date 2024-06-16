import 'package:bloc/bloc.dart';
import 'package:so_boleto/core/errors/app_errors.dart';

import 'base_state.dart';

mixin BaseCubit<T extends BaseState> on Cubit<T> {
  void onAppError(AppError error) {
    if (error is NoConnectionError) {
      return emit(state.copyWith(
        callbackMessage: error.message,
        status: BaseStateStatus.noConnection,
      ) as T);
    }

    return emit(state.copyWith(
      callbackMessage: error.message,
      status: BaseStateStatus.generalError,
    ) as T);
  }

  void unexpectedError(Object exception) {
    emit(state.copyWith(
      callbackMessage: 'Error',
      status: BaseStateStatus.generalError,
    ) as T);
  }
}
