import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/core/components/custom_category_icon/custom_category_item.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class HomePageFuture extends StatefulWidget {
  const HomePageFuture({super.key});

  @override
  State<HomePageFuture> createState() => _HomePageFutureState();
}

class _HomePageFutureState extends State<HomePageFuture>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: context.pop,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
            AppThemeValues.spaceHorizontalMassive,
            Text(
              'Contas futuras',
              style: context.textRobotoMediumToLarge,
            ),
          ],
        ),
        LineSeparator.horizontalLimitedThick(
          height: AppThemeValues.spaceXTiny,
          width: double.infinity,
          noPadding: true,
        ),
        BlocBuilder<HomeBillsCubit, HomeBillsState>(
          builder: (context, state) {
            final bills = state.futureBills;

            final message = state.paramsApplied
                ? PageResponseHandler.noneForTheseFilters
                : bills.isEmpty
                    ? PageResponseHandler.noneThatFarAhead
                    : PageResponseHandler.nonePayed;

            if (bills.isEmpty && state.querySearch.isNotEmpty) {
              return const CustomStatusHandler(
                  PageResponseHandler.noneWithThisName);
            } else if (bills.isEmpty) {
              return CustomStatusHandler(message);
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    LineSeparator.horizontal(noPadding: true),
                itemCount: bills.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final bill = bills[index];
                  final theme = context.read<ThemeCubit>().state;

                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.selectedColors.cardBackground,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppThemeValues.spaceXXSmall,
                          ),
                          child: ListTile(
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppThemeValues.spaceXXSmall,
                            ),
                            horizontalTitleGap: AppThemeValues.spaceXSmall,
                            leading: CustomCategoryItem(bill: bill),
                            title: Text(
                              bill.name.capitalize(),
                              style: context.textRobotoSubtitleSmall,
                              maxLines: 1,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBillInfoRow(
                                  label: 'Parcelas pagas  ',
                                  value: AppFormatters.parcelRelationFormatter(
                                    bill.totalParcels,
                                    bill.payedParcels,
                                  ),
                                ),
                                FutureBillInfoRow(
                                  label: 'Valor gasto em parcelas pagas  ',
                                  value: bill.totalPayedInThisBill.toString(),
                                  isDate: true,
                                ),
                                FutureBillInfoRow(
                                  label: 'Última parcela em  ',
                                  value: bill.lastParcelDate,
                                  isDate: true,
                                ),
                              ],
                            ),
                            // trailing: Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.end,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           bill.value.toDouble().formatCurrency(),
                            //           style: bill.value <= 0
                            //               ? context.textRobotoSubtitleTiny
                            //               : context.textRobotoSubtitleXSmall,
                            //           textAlign: TextAlign.right,
                            //         ),
                            //         Text(
                            //           AppFormatters.parcelRelationFormatter(
                            //             bill.totalParcels,
                            //             bill.payedParcels,
                            //           ),
                            //           textAlign: TextAlign.right,
                            //           style: context.textRobotoSubtitleTiny,
                            //         ),
                            //       ],
                            //     ),
                            //     const Padding(
                            //       padding: EdgeInsets.all(
                            //           AppThemeValues.spaceXXXSmall),
                            //       child: Icon(
                            //         Icons.arrow_forward_ios_rounded,
                            //         size: 16,
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class FutureBillInfoRow extends StatelessWidget {
  const FutureBillInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.isDate = false,
  });

  final String label;
  final String value;
  final bool isDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppThemeValues.spaceXTiny,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: context.textRobotoXSmall,
          ),
          Text(
            value,
            style: context.textRobotoSubtitleSmall,
          ),
        ],
      ),
    );
  }
}
