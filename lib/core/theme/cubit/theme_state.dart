// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

class ThemeState extends BaseState with EquatableMixin {
  ThemeState({
    required super.status,
    super.callbackMessage,
    this.isLightTheme = true,
  });

  final bool isLightTheme;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
    ];
  }

  @override
  ThemeState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    bool? isLighttheme,
  }) =>
      ThemeState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        isLightTheme: isLighttheme ?? isLightTheme,
      );
}
