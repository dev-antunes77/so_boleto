import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/filter/widgets/home_filter_icon_button.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_search_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Text(
        'Suas contas',
        style: context.textRobotoSubtitleMediumToLarge,
      ),
      actions: [
        const BillSearchBar(),
        ActionButton(
          icon: AppIcons.add,
          onTap: () => _onCreateBillPressed(context),
        ),
        const HomeFilterIconButton(),
      ],
    );
  }

  void _onCreateBillPressed(BuildContext context) {
    context.pushTo(
      Routes.billName,
      params: AppConstants.transitionScale,
    );
    context.read<HomeBillsCubit>().setSearchByNameValue('');
    context.read<BillCubit>().initiateCreationFlow();
  }
}
