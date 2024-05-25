import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/expanded_section/expanded_section.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';
import 'package:so_boleto/presenter/home/cubit/bill_cubit.dart';

class BillParcelSection extends StatefulWidget {
  const BillParcelSection(this.navigateSection, {super.key});

  final Function(bool) navigateSection;

  @override
  State<BillParcelSection> createState() => _BillParcelSectionState();
}

class _BillParcelSectionState extends State<BillParcelSection> {
  bool choice = false;
  final TextEditingController billParcelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppThemeValues.spaceVerticalImense,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Essa conta foi parcelada?',
              style: context.textRobotoSubtitleMedium,
            ),
            AppThemeValues.spaceHorizontalLarge,
            Switch(
              value: choice,
              onChanged: (value) => setState(() => choice = value),
            ),
          ],
        ),
        if (choice == false) ...[
          Padding(
            padding: const EdgeInsets.only(top: AppThemeValues.spaceEnormous),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary, width: 0.5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppThemeValues.spaceMedium,
                  vertical: AppThemeValues.spaceSmall,
                ),
                child: Text('Não', style: context.textRobotoSubtitleMedium),
              ),
            ),
          ),
          const Expanded(child: AppThemeValues.spaceVerticalEnormous),
        ] else ...[
          ExpandedSection(
            expand: choice,
            child: Padding(
              padding: const EdgeInsets.all(AppThemeValues.spaceEnormous),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quantas parcelas?',
                    style: context.textRobotoSubtitleMedium,
                  ),
                  BillTextField(
                    hitText: '',
                    textInputType: TextInputType.number,
                    width: context.width * 0.15,
                    controller: billParcelController,
                    onChanged: (value) =>
                        context.read<BillCubit>().onBillParcelsChange(value),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: AppThemeValues.spaceVerticalEnormous),
        ],
        BillSectionButtonRow(navigateSection: widget.navigateSection),
      ],
    );
  }
}
