// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

class ThemeState extends BaseState with EquatableMixin {
  ThemeState({
    required super.status,
    super.callbackMessage,
    this.isLightTheme = true,
    this.selectedColor = AppColors.primary,
  });

  final bool isLightTheme;
  final Color selectedColor;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
      isLightTheme,
      selectedColor,
    ];
  }

  @override
  ThemeState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    bool? isLightTheme,
    Color? selectedColor,
  }) =>
      ThemeState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        isLightTheme: isLightTheme ?? this.isLightTheme,
        selectedColor: selectedColor ?? this.selectedColor,
      );
}
