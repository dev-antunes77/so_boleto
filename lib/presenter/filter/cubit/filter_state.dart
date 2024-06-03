// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_cubit.dart';

class FilterState extends BaseState with EquatableMixin {
  FilterState({
    required super.status,
    super.callbackMessage,
    FilterParams? params,
  }) : params = params ?? FilterParams();

  final FilterParams params;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        params,
      ];

  @override
  FilterState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    FilterParams? params,
  }) =>
      FilterState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        params: params ?? this.params,
      );
}
