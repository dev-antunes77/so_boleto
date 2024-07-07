import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/custom_text_button.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/components/expanded_section/expanded_section.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/enums/page_transitions.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/dismissable_background.dart';

class BillListTile extends StatefulWidget {
  const BillListTile(
    this.bill, {
    super.key,
    this.isTagPreferenceScreen = false,
    required this.payedTagSelector,
  });

  final BillModel bill;
  final Widget payedTagSelector;
  final bool isTagPreferenceScreen;

  @override
  State<BillListTile> createState() => _BillListTileState();
}

class _BillListTileState extends State<BillListTile> {
  bool expand = false;

  void _toggleExpandDescription() => setState(() => expand = !expand);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().state;
    return GestureDetector(
      onTap: widget.isTagPreferenceScreen
          ? null
          : () {
              context.read<BillCubit>().initiateEditionFlow(bill: widget.bill);
              context.pushTo(Routes.billCheck,
                  params: PageTransitions.transitionScale);
            },
      child: Dismissible(
        key: Key(widget.bill.id),
        direction: widget.bill.billStatus.isPayed
            ? DismissDirection.endToStart
            : DismissDirection.horizontal,
        confirmDismiss: widget.isTagPreferenceScreen
            ? null
            : (direction) => _confirmDismiss(direction, context),
        background: const DismissableBackGround(
          payDragging: true,
        ),
        secondaryBackground: const DismissableBackGround(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.bill.billStatus.isPayed
                ? theme.selectedColors.cardBackground
                : null,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppThemeValues.spaceXXSmall,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppThemeValues.spaceSmall,
                  ),
                  horizontalTitleGap: AppThemeValues.spaceXSmall,
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: theme.selectedColors.circleBackground,
                        child: SvgAsset(
                          svg: widget.bill.category.getIconResponse(),
                          height: 30,
                          color: theme.selectedColors.icon,
                        ),
                      ),
                    ],
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.bill.name.capitalize(),
                        style: context.textRobotoSubtitleSmall,
                      ),
                      if (widget.bill.description.isNotEmpty) ...[
                        CustomTextButton(
                          label:
                              expand ? 'Fechar descrição' : 'Abrir descrição',
                          padding: EdgeInsets.zero,
                          fontSize: 12,
                          onPressed: widget.isTagPreferenceScreen
                              ? () {}
                              : _toggleExpandDescription,
                        ),
                        ExpandedSection(
                          expand: expand,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: AppThemeValues.spaceSmall),
                            child: Text(
                              widget.bill.description.capitalize(),
                              style: context.textRobotoXSmall,
                            ),
                          ),
                        )
                      ],
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.bill.billStatus != BillStatus.payed)
                        Text(
                          widget.bill.dueDay.properDueDay(),
                          style: context.textRobotoSubtitleTiny,
                        ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.bill.value.toDouble().formatCurrency(),
                            style: widget.bill.value <= 0
                                ? context.textRobotoSubtitleTiny
                                : context.textRobotoSubtitleXSmall,
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            AppFormatters.parcelRelationFormatter(
                              widget.bill.totalParcels,
                              widget.bill.payedParcels,
                            ),
                            textAlign: TextAlign.right,
                            style: context.textRobotoSubtitleTiny,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(AppThemeValues.spaceSmall),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              widget.payedTagSelector,
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _confirmDismiss(
          DismissDirection direction, BuildContext context) =>
      direction == DismissDirection.endToStart
          ? AppDialogs.confirmDeleteBill(context, widget.bill)
          : context.read<HomeBillsCubit>().setBillAsPaid(widget.bill);
}
