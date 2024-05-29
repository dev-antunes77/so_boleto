part of 'initial_cubit.dart';

final class InitialState extends BaseState with EquatableMixin {
  InitialState({
    required super.status,
    super.callbackMessage,
    required this.currentPage,
  });

  final BottomNavigatorPage currentPage;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        currentPage,
      ];

  @override
  InitialState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    BottomNavigatorPage? currentPage,
  }) =>
      InitialState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        currentPage: currentPage ?? this.currentPage,
      );
}
