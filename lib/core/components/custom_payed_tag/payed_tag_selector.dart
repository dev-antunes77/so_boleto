import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_payed_tag/bottom_bar_payed_tag.dart';
import 'package:so_boleto/core/components/custom_payed_tag/check_payed_tag.dart';
import 'package:so_boleto/core/components/custom_payed_tag/side_bar_payed_tag.dart';
import 'package:so_boleto/core/components/custom_payed_tag/stample_payed_tag.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';

class PayedTagSelector extends StatelessWidget {
  const PayedTagSelector(this.showTag, {super.key, required this.payedTag});

  final bool showTag;
  final PayedTag payedTag;

  @override
  Widget build(BuildContext context) {
    if (payedTag.ischeck) {
      return CheckPayedTag(
        showTag,
        color: AppColors.primary.withOpacity(0.5),
      );
    } else if (payedTag.isStample) {
      return StamplePayedTag(
        showTag,
        color: AppColors.primary.withOpacity(0.5),
      );
    } else if (payedTag.isSideBar) {
      return SideBarPayedTag(
        showTag: showTag,
        color: AppColors.primary.withOpacity(0.8),
      );
    } else {
      return BottomBarTag(
        showTag: showTag,
        color: AppColors.primary.withOpacity(0.8),
      );
    }
  }
}
