import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/components/custom_bottom_navigator/bottom_navigator_page.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';

part 'initial_state.dart';

class InitialCubit extends Cubit<InitialState> with BaseCubit {
  InitialCubit(
      // this._checkVersionUpdate,
      // this._listenUserChanges,
      // this._bottomButtonEventUseCase,
      // this._signIn,
      )
      : super(InitialState(
          status: BaseStateStatus.initial,
          currentPage: BottomNavigatorPage.list,
        ));

  // final CheckVersionUpdateUseCase _checkVersionUpdate;
  // final ListenUserChangesUseCase _listenUserChanges;
  // final BottomButtonEventUseCase _bottomButtonEventUseCase;
  // final SignInUseCase _signIn;

  // Future<UserModel?> trySignIn() async {
  //   try {
  //     final user = await _signIn();
  //     emit(state.copyWith(status: BaseStateStatus.success));
  //     return user;
  //   } on AppError catch (error) {
  //     onAppError(error);
  //     return null;
  //   }
  // }

  void onChangePage(BottomNavigatorPage page) =>
      emit(state.copyWith(currentPage: page));

  // Future<void> checkVersionUpdate() async {
  //   try {
  //     final update = await _checkVersionUpdate();
  //     if (update.version != VersionUtils.version.toString()) {
  //       if (update.forceUpdate) {
  //         emit(state.copyWith(status: BaseStateStatus.updateRequired));
  //         return;
  //       }
  //       emit(state.copyWith(status: BaseStateStatus.updateOptional));
  //       return;
  //     }
  //     emit(state.copyWith(status: BaseStateStatus.initial));
  //   } on AppError catch (error) {
  //     onAppError(error);
  //   }
  // }

  // void onChangePage(BottomNavigatorPage page) {
  //   // _bottomButtonEventUseCase.call(page);
  //   emit(state.copyWith(currentPage: page));
  // }

  // void onChangeShowingPlayer() =>
  //     emit(state.copyWith(showingLivePage: !state.showingLivePage));

  // void onShowOptionalUpdate() =>
  //     emit(state.copyWith(status: BaseStateStatus.success));

  // Stream<UserModel?> onListenUserChanges() => _listenUserChanges();
}
