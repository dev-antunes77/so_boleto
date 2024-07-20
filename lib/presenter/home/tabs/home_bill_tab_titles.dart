import 'package:flutter/material.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/home/widgets/tab_indicator.dart';

class HomeBillTabTitles extends StatelessWidget {
  const HomeBillTabTitles({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppThemeValues.spaceXXXSmall),
      child: TabBar(
        indicatorPadding: const EdgeInsets.only(
          top: AppThemeValues.spaceSmall,
        ),
        controller: _tabController,
        labelPadding: const EdgeInsets.symmetric(
            horizontal: AppThemeValues.spaceXXXSmall),
        tabs: [
          TabIndicator(
            AppLocalizations.current.homeTabAll,
          ),
          TabIndicator(
            AppLocalizations.current.homeTabPayed,
          ),
          TabIndicator(
            AppLocalizations.current.homeTabDelayed,
          ),
        ],
      ),
    );
  }
}
