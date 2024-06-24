import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/usecases/clear_user_storage.dart';
import 'package:so_boleto/domain/usecases/sign_out.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> with BaseCubit {
  ProfileCubit(this._signOutUsecase, this._clearUserStorage)
      : super(ProfileState(status: BaseStateStatus.initial));

  final SignOut _signOutUsecase;
  final ClearUserStorage _clearUserStorage;

  void onInit(UserModel user) {
    emit(state.copyWith(status: BaseStateStatus.initial, user: user));
  }

  Future<void> onLogout() async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await _signOutUsecase();
    emit(state.copyWith(status: BaseStateStatus.success));
  }
}
