import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/user.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> with BaseCubit {
  BillCubit()
      : super(BillState(status: BaseStateStatus.initial, bill: List.empty()));

  Future<void> getBills() async {
    try {} on AppError catch (error) {
      onAppError(error);
      emit(state.copyWith(
        status: BaseStateStatus.error,
      ));
    }
  }
}
