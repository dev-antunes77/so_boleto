// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

class ThemeState extends BaseState with EquatableMixin {
  ThemeState({
    required super.status,
    super.callbackMessage,
    this.isLightTheme = true,
    ThemeColors? selectedColors,
  }) : selectedColors = selectedColors ??
            ThemeColors.light(const Color.fromARGB(255, 4, 136, 59));

  final bool isLightTheme;
  final ThemeColors selectedColors;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
      isLightTheme,
      selectedColors,
    ];
  }

  @override
  ThemeState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    bool? isLightTheme,
    ThemeColors? selectedColors,
  }) =>
      ThemeState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        isLightTheme: isLightTheme ?? this.isLightTheme,
        selectedColors: selectedColors ?? this.selectedColors,
      );
}
