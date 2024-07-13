import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class MonthNavigator extends StatelessWidget {
  const MonthNavigator({
    super.key,
    required this.pageController,
    required this.months,
  });

  final PageController pageController;
  final List<DateTime> months;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBillsCubit, HomeBillsState, DateTime>(
      selector: (state) {
        return state.currentMonth;
      },
      builder: (context, month) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<HomeBillsCubit, HomeBillsState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: state.getOldBills(month).isEmpty
                      ? null
                      : () => _previousMonth(context, month),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                );
              },
            ),
            Text(
              DateFormat('MMMM yyyy').format(month).capitalize(),
              style: context.textRobotoMediumToLarge,
            ),
            if (month.month == months.last.month)
              Row(
                children: [
                  Text(
                    'Contas\nFuturas',
                    style:
                        context.textSmall.copyWith(fontWeight: FontWeight.w500),
                    textScaler: const TextScaler.linear(0.9),
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ],
              )
            else
              IconButton(
                onPressed: () => _nextMonth(context, month),
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              )
          ],
        );
      },
    );
  }

  void _previousMonth(BuildContext context, DateTime month) {
    final currentPage = pageController.page!.toInt();
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      final previousMonth = DateTime(month.year, month.month - 1);
      context.read<HomeBillsCubit>().onMonthCange(previousMonth);
    }
  }

  void _nextMonth(BuildContext context, DateTime month) {
    final currentPage = pageController.page!.toInt();
    if (currentPage < months.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      final nextMonth = DateTime(month.year, month.month + 1);
      context.read<HomeBillsCubit>().onMonthCange(nextMonth);
    }
  }
}
