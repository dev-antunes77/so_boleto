import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_payed_tag/payed_tag_selector.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/presenter/home/widgets/bill_tiles/bill_list_tile.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class PaymentTagChoiceTile extends StatelessWidget {
  const PaymentTagChoiceTile({
    super.key,
    required this.tagChoiceBill,
    required this.label,
    required this.tag,
  });

  final BillModel tagChoiceBill;
  final String label;
  final PayedTag tag;

  @override
  Widget build(BuildContext context) {
    final colors = context.read<ThemeCubit>().state.selectedColors;

    return BlocBuilder<InitialCubit, InitialState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final isSelected = state.user!.payedTag == tag;
        return GestureDetector(
          onTap: () => context.read<InitialCubit>().onUpdateUserTag(tag),
          child: DecoratedBox(
            decoration: isSelected
                ? BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: colors.text,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  )
                : const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: isSelected ? colors.text : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppThemeValues.spaceMedium,
                      vertical: AppThemeValues.spaceXTiny,
                    ),
                    child: Text(
                      label,
                      style: context.textRobotoSubtitleMedium.copyWith(
                        color: isSelected ? colors.inversedText : null,
                      ),
                    ),
                  ),
                ),
                BillListTile(
                  bill: tagChoiceBill,
                  payedTag: tag,
                  payedTagSelector: PayedTagSelector(
                    tagChoiceBill.billPayment.first.billStatus.isPayed,
                    payedTag: tag,
                  ),
                  date: AppConstants.currentDate,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
