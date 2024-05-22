import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/usecases/sign_in_usecase.dart';
import 'package:so_boleto/domain/usecases/sign_up_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with BaseCubit {
  LoginCubit(this._signUp, this._signIn)
      : super(LoginState(status: BaseStateStatus.initial));

  final SignUpUseCase _signUp;
  final SignInUseCase _signIn;

  Future<void> onSignIn() async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final user = await _signIn();
      if (user == null) {
        emit(state.copyWith(
            status: BaseStateStatus.initial,
            callbackMessage: 'Você não está cadastrado'));
      } else {
        await _signIn();
        emit(state.copyWith(status: BaseStateStatus.success));
      }
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onSignUp(UserModel user) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _signUp(user);

      emit(state.copyWith(status: BaseStateStatus.success));
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  // void onChangeMsisdn(String msisdn) => emit(state.copyWith(msisdn: msisdn));

  // void onChangePinCode(String digit, int position) => emit(
  //       state.copyWith(
  //         pinCode: state.pinCode.replaceCharAt(digit[0], position),
  //       ),
  //     );
}
