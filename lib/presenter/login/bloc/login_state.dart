part of 'login_cubit.dart';

final class LoginState extends BaseState with EquatableMixin {
  LoginState({
    required super.status,
    super.callbackMessage,
    this.msisdn = '',
    this.pinCode = '****',
  });

  final String msisdn;
  final String pinCode;

  @override
  List<Object> get props => [status, callbackMessage, msisdn];

  @override
  LoginState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    String? msisdn,
    String? pinCode,
  }) =>
      LoginState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        msisdn: msisdn ?? this.msisdn,
        pinCode: pinCode ?? this.pinCode,
      );
}
