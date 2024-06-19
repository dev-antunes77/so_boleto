import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/usecases/sign_in.dart';
import 'package:so_boleto/domain/usecases/sign_up.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with BaseCubit {
  LoginCubit(this._signUp, this._signIn)
      : super(LoginState(status: BaseStateStatus.initial));

  final SignUp _signUp;
  final SignIn _signIn;

  Future<void> onSignUp(UserModel user) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _signUp(user);

      emit(state.copyWith(status: BaseStateStatus.success));
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onSignIn(UserModel user) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _signIn(user.email, user.password);
      emit(state.copyWith(status: BaseStateStatus.success));
    } on AppError catch (error) {
      onAppError(error);
    }
  }
}
