// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

class ProfileState extends BaseState with EquatableMixin {
  ProfileState({
    required super.status,
    super.callbackMessage,
    this.allowSecurityAccess = false,
    UserData? user,
  }) : user = user ?? UserData();

  final UserData user;
  final bool allowSecurityAccess;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
      user,
      allowSecurityAccess,
    ];
  }

  @override
  ProfileState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    UserData? user,
    bool? allowSecurityAccess,
  }) =>
      ProfileState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        user: user ?? this.user,
        allowSecurityAccess: allowSecurityAccess ?? this.allowSecurityAccess,
      );
}
