import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/status_page/widgets/base_status_page.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BaseStatusPage(
      onTap: onTap,
      title: AppLocalizations.current.errorNoConnectionPage,
      icon: AppIcons.money,
    );
  }
}
