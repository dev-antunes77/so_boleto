import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/filter_params.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> with BaseCubit {
  FilterCubit() : super(FilterState(status: BaseStateStatus.initial));
}
