import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key, this.bill});

  final BillModel? bill;

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final TextEditingController billNameController = TextEditingController();
  final TextEditingController billDescriptionController =
      TextEditingController();

  bool testing = true;

  List<String> values = [
    'rent',
    'groceries',
    'transportation',
    'automobile',
    'insurance',
    'communication',
    'entertainment',
    'healthCare',
    'creditCard',
    'travel',
    'debt',
    'investiment',
    'miscellaneous',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          BillTextField(hitText: 'Nome da conta'),
          BillTextField(hitText: 'Descrição da conta'),
          Row(
            children: [
              BillTextField(
                hitText: 'Valor',
                width: context.width * 0.3,
              ),
              SizedBox(
                width: context.width * 0.4,
                child: DropdownButton(
                    underline: const SizedBox(),
                    hint: Text('Categories'),
                    menuMaxHeight: context.height * 0.45,
                    value: values.first,
                    items: values
                        .map(
                          (e) => DropdownMenuItem(value: e, child: Text(e)),
                        )
                        .toList(),
                    onChanged: (newValue) => testing = false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BillTextField extends StatelessWidget {
  const BillTextField({
    super.key,
    required this.hitText,
    this.icon,
    this.textInputType,
    this.width,
  });

  final String hitText;
  final String? icon;
  final TextInputType? textInputType;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppThemeValues.spaceMedium),
      child: Row(
        children: [
          SvgAsset(svg: icon ?? AppIcons.miscellaneous, height: 26),
          AppThemeValues.spaceHorizontalMedium,
          Container(height: 30, color: AppColors.greyLight, width: 1),
          AppThemeValues.spaceHorizontalMedium,
          SizedBox(
            width: width ?? context.width * 0.65,
            child: TextField(
              keyboardType: textInputType ?? TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: hitText,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
