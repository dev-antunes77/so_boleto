// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_cubit.dart';

class FilterState extends BaseState with EquatableMixin {
  FilterState({
    required super.status,
    super.callbackMessage,
    FilterParams? params,
    List<BillCategory>? categoryFilters,
  })  : params = params ?? FilterParams(),
        categoryFilters = categoryFilters ?? [];

  final FilterParams params;
  final List<BillCategory> categoryFilters;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        params,
        categoryFilters,
      ];

  @override
  FilterState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    FilterParams? params,
    List<BillCategory>? categoryFilters,
  }) =>
      FilterState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        params: params ?? this.params,
        categoryFilters: categoryFilters ?? this.categoryFilters,
      );
}
