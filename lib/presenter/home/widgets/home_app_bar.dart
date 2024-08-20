import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/filter/widgets/home_filter_icon_button.dart';
import 'package:so_boleto/presenter/home/widgets/bill_search_bar.dart';
import 'package:so_boleto/presenter/home/widgets/more_options_achor_menu.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isExpanded = false;

  void _onExpand() => setState(() => isExpanded = true);
  void _onCloseSearch() => setState(() => isExpanded = false);

  @override
  Widget build(BuildContext context) {
    final themeColors = context.read<ThemeCubit>().state.selectedColors;
    return CustomAppBar(
      title: AppLocalizations.current.homeAppBarTitle,
      actions: [
        BillSearchBar(
          isExpanded: isExpanded,
          onExpand: _onExpand,
          onCloseSearch: _onCloseSearch,
          themeColors: themeColors,
        ),
        AppThemeValues.spaceHorizontalXXXSmall,
        HomeFilterIconButton(themeColors),
        if (!isExpanded) const MoreOptionsAnchorMenu(),
      ],
    );
  }
}
