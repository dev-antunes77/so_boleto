part of 'initial_cubit.dart';

final class InitialState extends BaseState with EquatableMixin {
  InitialState({
    required super.status,
    super.callbackMessage,
    required this.currentPage,
    this.user,
  });

  final BottomNavigatorPage currentPage;
  final UserModel? user;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        currentPage,
        user,
      ];

  @override
  InitialState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    BottomNavigatorPage? currentPage,
    UserModel? user,
  }) =>
      InitialState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        currentPage: currentPage ?? this.currentPage,
        user: user ?? this.user,
      );
}
