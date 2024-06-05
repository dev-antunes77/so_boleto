// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_cubit.dart';

class FilterState extends BaseState with EquatableMixin {
  FilterState({
    required super.status,
    super.callbackMessage,
    List<FilterPill>? pills,
    List<int>? parcelFilter,
    List<int>? dueDayFilter,
    List<int>? priceFilter,
    bool? parcelSelected,
    bool? priceSelected,
    bool? dueDaySelected,
  })  : pills = pills ?? FilterPill.filterList,
        parcelFilter = parcelFilter ?? AppConstants.parcelOrDueDayRanges.first,
        dueDayFilter = dueDayFilter ?? AppConstants.parcelOrDueDayRanges.first,
        priceFilter = priceFilter ?? AppConstants.priceRanges.first,
        parcelSelected = parcelSelected ?? false,
        priceSelected = priceSelected ?? false,
        dueDaySelected = dueDaySelected ?? false;

  final List<FilterPill> pills;
  final List<int> parcelFilter;
  final List<int> dueDayFilter;
  final List<int> priceFilter;
  final bool parcelSelected;
  final bool priceSelected;
  final bool dueDaySelected;

  @override
  List<Object> get props {
    return [
      pills,
      parcelFilter,
      dueDayFilter,
      priceFilter,
      parcelSelected,
      priceSelected,
      dueDaySelected,
    ];
  }

  @override
  FilterState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    List<FilterPill>? pills,
    List<int>? parcelFilter,
    List<int>? dueDayFilter,
    List<int>? priceFilter,
    bool? parcelSelected,
    bool? priceSelected,
    bool? dueDaySelected,
  }) =>
      FilterState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        pills: pills ?? this.pills,
        parcelFilter: parcelFilter ?? this.parcelFilter,
        dueDayFilter: dueDayFilter ?? this.dueDayFilter,
        priceFilter: priceFilter ?? this.priceFilter,
        parcelSelected: parcelSelected ?? this.parcelSelected,
        priceSelected: priceSelected ?? this.priceSelected,
        dueDaySelected: dueDaySelected ?? this.dueDaySelected,
      );
}
