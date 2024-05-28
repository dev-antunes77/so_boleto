import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/svg_button.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/system_overlay_utils.dart';
import 'package:so_boleto/injection_service.dart';
import 'package:so_boleto/presenter/login/bloc/login_cubit.dart';

class LoginShell extends StatelessWidget {
  const LoginShell({
    super.key,
    this.hasBackButton = false,
    required this.child,
  });
  final Widget child;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InjectionService.get<LoginCubit>(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemOverlayUtils.white,
        child: PopScope(
          canPop: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: CustomSafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppThemeValues.spaceImense,
                  bottom: AppThemeValues.spaceXLarge,
                ),
                child: Column(
                  children: [
                    if (hasBackButton)
                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgButton(
                          svg: AppIcons.money,
                          onTap: () => context.pop,
                        ),
                      ),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
