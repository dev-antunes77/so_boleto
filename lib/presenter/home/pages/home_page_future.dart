import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/core/components/custom_category_icon/custom_category_item.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/future_bill_info_row.dart';

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
              AppLocalizations.current.homeTabFutureBills,
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
                separatorBuilder: (context, index) => const SizedBox(height: 6),
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
                            horizontal: AppThemeValues.spaceSmall,
                            vertical: AppThemeValues.spaceXXSmall,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bill.name.capitalize(),
                                style: context.textRobotoSubtitleSmall,
                                maxLines: 1,
                              ),
                              LineSeparator.horizontalThickWithPadding(
                                width: context.width * 0.8,
                                height: 2,
                                horizontalPadding: 0.0,
                              ),
                              FutureBillInfoRow(
                                label:
                                    AppLocalizations.current.homeTabFutureTotal,
                                value: bill.totalValue.formatCurrency(),
                              ),
                              Row(
                                children: [
                                  FutureBillInfoRow(
                                    label: AppLocalizations
                                        .current.homeTabFuturePaied,
                                    value:
                                        bill.totalPayedStringValue.toString(),
                                  ),
                                  const SizedBox(
                                      width: AppThemeValues.spaceXXSmall),
                                  Text(
                                    '(${AppFormatters.parcelRelationFormatter(
                                      bill.totalParcels,
                                      bill.payedParcels,
                                    )})',
                                    style: context.textRobotoSubtitleSmall,
                                    textScaler: const TextScaler.linear(1.1),
                                  ),
                                  const SizedBox(
                                      width: AppThemeValues.spaceXXSmall),
                                  FutureBillInfoRow(
                                    label: AppLocalizations
                                        .current.homeTabFutureBills,
                                    value:
                                        bill.totalUnpayedValue.formatCurrency(),
                                  ),
                                ],
                              ),
                              FutureBillInfoRow(
                                label: AppLocalizations
                                    .current.homeTabFutureLastParcel,
                                value: bill.lastParcelDate,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: AppThemeValues.spaceXXXSmall,
                          top: AppThemeValues.spaceXXXSmall,
                          child: Align(
                              alignment: Alignment.topRight,
                              child:
                                  CustomCategoryItem(category: bill.category)),
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
