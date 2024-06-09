import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_anchor.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/page_transitions.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/filter/widgets/home_filter_icon_button.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_search_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: AppLocalizations.current.homeAppBarTitle,
      actions: [
        const BillSearchBar(),
        AppThemeValues.spaceHorizontalXXXSmall,
        const HomeFilterIconButton(),
        CustomMenuAnchor(
          mainIcon: AppIcons.more,
          mainIconHeight: 30,
          firstChildIcon: AppIcons.add,
          firstChildLabel: AppLocalizations.current.homeAppBarAddNewBill,
          onfirstChildPressed: () => _onCreateBillPressed(context),
          secondChildIcon: AppIcons.addReady,
          secondChildLabel: AppLocalizations.current.homeAppBarAddPromptBills,
          onsecondChildPressed: () => context.pushTo(Routes.promptBills),
        ),
      ],
    );
  }

  void _onCreateBillPressed(BuildContext context) {
    context.pushTo(
      Routes.billName,
      params: PageTransitions.transitionScale,
    );
    context.read<HomeBillsCubit>().setSearchByNameValue('');
    context.read<BillCubit>().initiateCreationFlow();
  }
}
