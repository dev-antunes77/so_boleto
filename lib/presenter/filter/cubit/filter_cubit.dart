import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/filter_params.dart';
import 'package:so_boleto/presenter/filter/models/filter_pill.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> with BaseCubit {
  FilterCubit() : super(FilterState(status: BaseStateStatus.initial));

  void onFilterPillSelected(FilterPill pill) {
    for (var element in state.pills) {
      if (element.category == pill.category) {
        element.isSelected = !element.isSelected;
      }
    }
    emit(state.copyWith(
        status: BaseStateStatus.updateRequired, pills: state.pills));
  }

  void onParcelsSelected({List<int>? parcels, bool? value}) {
    emit(
      state.copyWith(
        status: BaseStateStatus.updateRequired,
        parcelFilter:
            value ?? false ? AppConstants.parcelOrDueDayRanges.first : parcels,
        parcelSelected: value,
      ),
    );
  }

  void onPricelsSelected({List<int>? priceRange, bool? value}) {
    emit(
      state.copyWith(
        status: BaseStateStatus.updateRequired,
        priceFilter:
            value ?? false ? AppConstants.priceRanges.first : priceRange,
        priceSelected: value,
      ),
    );
  }

  void onDueDaySelected({List<int>? dueDayRange, bool? value}) {
    emit(
      state.copyWith(
        dueDayFilter: value ?? false
            ? AppConstants.parcelOrDueDayRanges.first
            : dueDayRange,
        dueDaySelected: value,
      ),
    );
  }

  bool areFiltersValid() =>
      state.parcelSelected ||
      state.dueDaySelected ||
      state.priceSelected ||
      state.pills.any(
        (element) => element.isSelected,
      );

  FilterParams createFilterParams() {
    List<BillCategory> categories = [];
    for (var pill in state.pills) {
      if (pill.isSelected) {
        categories.add(pill.category);
      }
    }
    return FilterParams(
      categoryList: categories,
      dueDayRange: state.dueDaySelected
          ? state.dueDayFilter
          : AppConstants.parcelOrDueDayRanges.first,
      priceRange: state.priceSelected
          ? state.priceFilter
          : AppConstants.priceRanges.first,
      parcelRange: state.parcelSelected
          ? state.parcelFilter
          : AppConstants.parcelOrDueDayRanges.first,
    );
  }

  void removeFilters() {
    for (var pill in state.pills) {
      pill.isSelected = false;
    }
    emit(state.copyWith(
      status: BaseStateStatus.success,
      parcelFilter: AppConstants.parcelOrDueDayRanges.first,
      dueDayFilter: AppConstants.parcelOrDueDayRanges.first,
      priceFilter: AppConstants.priceRanges.first,
    ));
  }
}
