import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';

class ProfileOptionsAppBar extends StatelessWidget {
  const ProfileOptionsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: _displayProperTitle(context.currentRoute),
      leadingBackButton: context.currentRoute == Routes.profile
          ? null
          : const CustomBackButton(),
    );
  }

  String _displayProperTitle(String route) {
    switch (route) {
      case Routes.profileTheme:
        return AppLocalizations.current.profileTheme;
      case Routes.profileDueDay:
        return AppLocalizations.current.profileDueDay;
      case Routes.profilePayedTag:
        return AppLocalizations.current.profilePaymentTag;
      case Routes.profileSecurity:
        return AppLocalizations.current.profileSecurity;
      case Routes.profileViewPicture:
        return AppLocalizations.current.profilePhoto;
    }
    return AppLocalizations.current.profileMyProfile;
  }
}
