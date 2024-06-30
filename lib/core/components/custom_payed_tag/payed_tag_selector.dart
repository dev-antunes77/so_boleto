import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_payed_tag/bottom_bar_payed_tag.dart';
import 'package:so_boleto/core/components/custom_payed_tag/check_payed_tag.dart';
import 'package:so_boleto/core/components/custom_payed_tag/side_bar_payed_tag.dart';
import 'package:so_boleto/core/components/custom_payed_tag/stample_payed_tag.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';

class PayedTagSelector extends StatelessWidget {
  const PayedTagSelector(this.showTag, {super.key, required this.payedTag});

  final bool showTag;
  final PayedTag payedTag;

  @override
  Widget build(BuildContext context) {
    final color = context.read<ThemeCubit>().state.selectedColors.tag;
    if (payedTag.ischeck) {
      return CheckPayedTag(
        showTag,
        color: color,
      );
    } else if (payedTag.isStample) {
      return StamplePayedTag(
        showTag,
        color: color,
      );
    } else if (payedTag.isSideBar) {
      return SideBarPayedTag(
        showTag: showTag,
        color: color,
      );
    } else {
      return BottomBarTag(
        showTag: showTag,
        color: color,
      );
    }
  }
}
