// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

class ProfileState extends BaseState with EquatableMixin {
  ProfileState({
    required super.status,
    super.callbackMessage,
    UserModel? user,
  }) : user = user ?? InjectionService.get<InitialCubit>().state.user!;

  final UserModel user;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
    ];
  }

  @override
  ProfileState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
  }) =>
      ProfileState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
      );
}