part of 'initial_cubit.dart';

final class InitialState extends BaseState with EquatableMixin {
  InitialState({
    required super.status,
    super.callbackMessage,
    required this.currentPage,
    this.showingLivePage = false,
  });

  final BottomNavigatorPage currentPage;
  final bool showingLivePage;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        currentPage,
        showingLivePage,
      ];

  @override
  InitialState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    BottomNavigatorPage? currentPage,
    bool? showingLivePage,
  }) =>
      InitialState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        currentPage: currentPage ?? this.currentPage,
        showingLivePage: showingLivePage ?? this.showingLivePage,
      );
}
