import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/enums/due_day_and_parcel_ranges.dart';
import 'package:so_boleto/domain/models/enums/price_ranges.dart';
import 'package:so_boleto/domain/models/filter_params.dart';
import 'package:so_boleto/domain/models/filter_pill.dart';

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
            value ?? false ? DueDayOrParcelRanges.upToThree.value : parcels,
        parcelSelected: value,
      ),
    );
  }

  void onPricelsSelected({List<int>? priceRange, bool? value}) {
    emit(
      state.copyWith(
        status: BaseStateStatus.updateRequired,
        priceFilter:
            value ?? false ? PriceRanges.upToHundred.value : priceRange,
        priceSelected: value,
      ),
    );
  }

  void onDueDaySelected({List<int>? dueDayRange, bool? value}) {
    emit(
      state.copyWith(
        dueDayFilter:
            value ?? false ? DueDayOrParcelRanges.upToThree.value : dueDayRange,
        dueDaySelected: value,
      ),
    );
  }

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
          : DueDayOrParcelRanges.upToThree.value,
      priceRange: state.priceSelected
          ? state.priceFilter
          : PriceRanges.upToHundred.value,
      parcelRange: state.parcelSelected
          ? state.parcelFilter
          : DueDayOrParcelRanges.upToThree.value,
    );
  }

  void removeFilters() {
    for (var pill in state.pills) {
      pill.isSelected = false;
    }
    emit(state.copyWith(
      status: BaseStateStatus.success,
      parcelFilter: DueDayOrParcelRanges.upToThree.value,
      dueDayFilter: DueDayOrParcelRanges.upToThree.value,
      priceFilter: PriceRanges.upToHundred.value,
    ));
  }
}
