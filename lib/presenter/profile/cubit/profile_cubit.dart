import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/usecases/clear_user_storage.dart';
import 'package:so_boleto/domain/usecases/confirm_user_password.dart';
import 'package:so_boleto/domain/usecases/sign_out.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> with BaseCubit {
  ProfileCubit(this._signOutUsecase, this._clearUserStorage,
      this._confirmUserPasswordUsecase)
      : super(ProfileState(status: BaseStateStatus.initial));

  final SignOut _signOutUsecase;
  final ConfirmUserPassword _confirmUserPasswordUsecase;
  final ClearUserStorage _clearUserStorage;

  void onInit(String userId) {
    emit(state.copyWith(status: BaseStateStatus.initial, userId: userId));
  }

  Future<void> onLogout() async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await _signOutUsecase();
    emit(state.copyWith(status: BaseStateStatus.success));
  }

  Future<void> allowAccess({String? password, bool denyAccess = false}) async {
    try {
      if (denyAccess) {
        emit(state.copyWith(
            status: BaseStateStatus.initial, allowSecurityAccess: false));
      } else {
        emit(state.copyWith(status: BaseStateStatus.loading));
        final allow =
            await _confirmUserPasswordUsecase(state.userId, password!);
        if (allow) {
          emit(state.copyWith(
              status: BaseStateStatus.success, allowSecurityAccess: true));
        } else {
          emit(state.copyWith(
              status: BaseStateStatus.focusedError,
              allowSecurityAccess: false));
        }
      }
    } on AppError catch (error) {
      onAppError(error);
    }
  }
}
