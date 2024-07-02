// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

class ProfileState extends BaseState with EquatableMixin {
  ProfileState({
    required super.status,
    super.callbackMessage,
    this.allowSecurityAccess = false,
    this.userId = '',
  });

  final bool allowSecurityAccess;
  final String userId;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
      allowSecurityAccess,
      userId,
    ];
  }

  @override
  ProfileState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    String? userId,
    bool? allowSecurityAccess,
  }) =>
      ProfileState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        allowSecurityAccess: allowSecurityAccess ?? this.allowSecurityAccess,
        userId: userId ?? this.userId,
      );
}
