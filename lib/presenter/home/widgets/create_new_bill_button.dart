import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class CreateNewBillButoon extends StatelessWidget {
  const CreateNewBillButoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pushTo(
          Routes.billName,
          params: AppConstants.transitionScale,
        );
        context.read<HomeBillsCubit>().onFilterForBill('');
        context.read<BillCubit>().initiateCreationFlow();
      },
      icon: const SvgAsset(
        svg: AppIcons.add,
        height: 32,
        color: AppColors.primary,
      ),
    );
  }
}
