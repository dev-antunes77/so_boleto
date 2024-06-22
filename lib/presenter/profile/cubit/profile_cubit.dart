import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/injection_service.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> with BaseCubit {
  ProfileCubit() : super(ProfileState(status: BaseStateStatus.initial));

  void onInit(int thisMonth) {
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
      ),
    );
  }
}
