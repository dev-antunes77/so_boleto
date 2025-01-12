import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/bottom_navigator_page.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/bill_sorting.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/domain/models/user_data.dart';
import 'package:so_boleto/domain/usecases/create_user.dart';
import 'package:so_boleto/domain/usecases/create_user_storage.dart';
import 'package:so_boleto/domain/usecases/get_user_from_firebase.dart';
import 'package:so_boleto/domain/usecases/get_user_from_storage.dart';
import 'package:so_boleto/domain/usecases/sign_in.dart';
import 'package:so_boleto/domain/usecases/sign_in_with_ggogle.dart';
import 'package:so_boleto/domain/usecases/sign_up.dart';
import 'package:so_boleto/domain/usecases/update_user_storage.dart';

part 'initial_state.dart';

class InitialCubit extends Cubit<InitialState> with BaseCubit {
  InitialCubit(
    this._signUpUsecase,
    this._signInUsecase,
    this._getUserFromStorageUsecase,
    this._getUserFromFirebaseUsecase,
    this._signInWithGgogleUsecase,
    this._createUserUsecase,
    this._createUserStorageUsecase,
    this._updateUserStorage,
  ) : super(InitialState(
          status: BaseStateStatus.initial,
          currentPage: BottomNavigatorPage.bills,
        ));
  final CreateUser _createUserUsecase;
  final CreateUserStorage _createUserStorageUsecase;
  final UpdateUserStorage _updateUserStorage;
  final GetUserFromStorage _getUserFromStorageUsecase;
  final GetUserFromFirebase _getUserFromFirebaseUsecase;
  final SignInWithGgogle _signInWithGgogleUsecase;
  final SignUp _signUpUsecase;
  final SignIn _signInUsecase;

  Future<void> onInit() async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await Future.delayed(const Duration(seconds: 4)).then((_) async {
        final storageUser = await _getUserFromStorageUsecase();
        if (storageUser != null) {
          final decodedPassword = storageUser.password.decodePassword();
          await _signInUsecase(storageUser.email, decodedPassword);
        }
        emit(
            state.copyWith(status: BaseStateStatus.success, user: storageUser));
      });
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onSignUp(UserData user) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final userId = await _signUpUsecase(user, user.password.decodePassword());
      final identifiedUser = user.copyWith(id: userId);
      await _createUserUsecase(identifiedUser);
      await _createUserStorageUsecase(identifiedUser);
      emit(state.copyWith(
          status: BaseStateStatus.success, user: identifiedUser));
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onSignInWithGoogle() async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final user = await _signInWithGgogleUsecase();
      if (user != null) {
        final userToStore = UserData.fromGoogle(user);
        await _createUserStorageUsecase(userToStore);
        emit(
            state.copyWith(status: BaseStateStatus.success, user: userToStore));
      }
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onSignIn(String email, String password) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final userId = await _signInUsecase(email, password.decodePassword());
      final apiUser = await _getUserFromFirebaseUsecase(userId);
      final userToStore = apiUser.copyWith(password: password);
      await _createUserStorageUsecase(userToStore);
      emit(state.copyWith(status: BaseStateStatus.success, user: userToStore));
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onSkipOnboarding() async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await Future.delayed(const Duration(seconds: 2)).then((_) async {
        final updatedUser = state.user!.copyWith(hasSeenOnboarding: true);
        await _updateUserStorage(updatedUser);
        emit(state.copyWith(user: updatedUser));
      });
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  void onChangePage(BottomNavigatorPage page) =>
      emit(state.copyWith(currentPage: page));

  Future<void> onUpdateUserTag(PayedTag payedTag) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final updatedUser = state.user!.copyWith(payedTag: payedTag);
      await _updateUserStorage(updatedUser);
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          user: updatedUser,
        ),
      );
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onUpdateBillSorting(BillSorting billSorting) async {
    try {
      final hasInvertedSorting = state.user!.billSorting == billSorting &&
          state.user!.hasInvertedSorting;
      final updatedUser = state.user!.copyWith(
        billSorting: billSorting,
        hasInvertedSorting: hasInvertedSorting,
      );
      await _updateUserStorage(updatedUser);
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          user: updatedUser,
        ),
      );
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onUpdateUserFavoredDueDay(int dueDay) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final updatedUser = state.user!.copyWith(favoredDueDay: dueDay);
      await _updateUserStorage(updatedUser);
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          user: updatedUser,
        ),
      );
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onUpdateUserThemeColors(
      Color baseColor, bool hasLightTheme) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final updatedUser = state.user!.copyWith(
        hasLightTheme: hasLightTheme,
        baseColor: baseColor,
      );
      await _updateUserStorage(updatedUser);
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          user: updatedUser,
        ),
      );
    } on AppError catch (error) {
      onAppError(error);
    }
  }

  Future<void> onUpdateUserProfilePictrue(String path) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final updatedUser = state.user!.copyWith(profilePicturePath: path);
      await _updateUserStorage(updatedUser);
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          user: updatedUser,
        ),
      );
    } on AppError catch (error) {
      onAppError(error);
    }
  }
}
