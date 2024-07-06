import 'package:flutter/material.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_images.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class AnimatedThemeSwitch extends StatefulWidget {
  const AnimatedThemeSwitch({
    super.key,
    required this.isLightTheme,
    required this.onSwitchTheme,
  });

  final bool isLightTheme;
  final Function(bool) onSwitchTheme;

  @override
  State<AnimatedThemeSwitch> createState() => _AnimatedThemeSwitchState();
}

class _AnimatedThemeSwitchState extends State<AnimatedThemeSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.isLightTheme
                  ? const AssetImage(AppImages.lightMode)
                  : const AssetImage(AppImages.darkMode),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                  opacity: widget.isLightTheme ? 0.5 : 1,
                  child: Text(AppLocalizations.current.profileThemeDark,
                      style: context.textRobotoMedium.copyWith(
                          fontWeight: widget.isLightTheme
                              ? FontWeight.normal
                              : FontWeight.bold))),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppThemeValues.spaceSmall,
                ),
                child: Switch.adaptive(
                  value: widget.isLightTheme,
                  onChanged: widget.onSwitchTheme,
                  inactiveTrackColor: Colors.transparent,
                  activeTrackColor: Colors.transparent,
                  trackOutlineColor: WidgetStateProperty.resolveWith(
                    (states) {
                      return states.contains(WidgetState.selected)
                          ? Colors.black26
                          : Colors.white54;
                    },
                  ),
                  thumbIcon: WidgetStateProperty.resolveWith(
                    (states) {
                      return states.contains(WidgetState.selected)
                          ? const Icon(
                              Icons.sunny,
                              color: Color.fromARGB(255, 207, 157, 5),
                            )
                          : const Icon(Icons.dark_mode_sharp);
                    },
                  ),
                ),
              ),
              Opacity(
                  opacity: widget.isLightTheme ? 1 : 0.5,
                  child: Text(AppLocalizations.current.profileThemeLight,
                      style: context.textRobotoMedium.copyWith(
                          fontWeight: widget.isLightTheme
                              ? FontWeight.bold
                              : FontWeight.normal))),
            ],
          ),
        );
      },
    );
  }
}
