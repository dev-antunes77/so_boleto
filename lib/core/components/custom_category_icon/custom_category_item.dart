import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/domain/models/bill.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.bill,
  });

  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().state;

    return CircleAvatar(
      radius: 25,
      backgroundColor: theme.selectedColors.circleBackground,
      child: SvgAsset(
        svg: bill.category.getIconResponse,
        height: 30,
        color: theme.selectedColors.icon,
      ),
    );
  }
}
