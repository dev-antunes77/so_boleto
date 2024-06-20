import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/bottom_navigator_page.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/usecases/get_user_from_firebase.dart';
import 'package:so_boleto/domain/usecases/get_user_from_storage.dart';
import 'package:so_boleto/domain/usecases/sign_in.dart';
import 'package:so_boleto/domain/usecases/sign_up.dart';

part 'initial_state.dart';

class InitialCubit extends Cubit<InitialState> with BaseCubit {
  InitialCubit(
    this._signUpUsecase,
    this._signInUsecase,
    this._getUserFromStorageUsecase,
    this._getUserFromFirebaseUsecase,
  ) : super(InitialState(
          status: BaseStateStatus.initial,
          currentPage: BottomNavigatorPage.bills,
        ));

  final GetUserFromStorage _getUserFromStorageUsecase;
  final GetUserFromFirebase _getUserFromFirebaseUsecase;
  final SignUp _signUpUsecase;
  final SignIn _signInUsecase;

  Future<void> onInit() async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await Future.delayed(const Duration(seconds: 3));
      final storageUser = await _getUserFromStorageUsecase();
      if (storageUser != null) {
        final password = storageUser.password.decodePassword();
        await _signInUsecase(storageUser.email, password);
      }
      emit(state.copyWith(status: BaseStateStatus.success, user: storageUser));
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onSignUp(UserModel user, String password) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _signUpUsecase(user, password);
      final apiUser = await _getUserFromFirebaseUsecase(user.id);
      emit(state.copyWith(status: BaseStateStatus.success, user: apiUser));
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onSignIn(UserModel user, String password) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _signInUsecase(user.email, password);
      emit(state.copyWith(status: BaseStateStatus.success));
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  void onChangePage(BottomNavigatorPage page) =>
      emit(state.copyWith(currentPage: page));
}
