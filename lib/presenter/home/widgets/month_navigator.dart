import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class MonthNavigator extends StatefulWidget {
  const MonthNavigator({
    super.key,
    required this.pageController,
    required this.months,
  });

  final PageController pageController;
  final List<DateTime> months;

  @override
  State<MonthNavigator> createState() => _MonthNavigatorState();
}

class _MonthNavigatorState extends State<MonthNavigator> {
  @override
  void initState() {
    context.read<HomeBillsCubit>().onMonthCange(widget.months.last);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBillsCubit, HomeBillsState, DateTime>(
      selector: (state) {
        return state.currentMonth;
      },
      builder: (context, month) {
        final isListEmpty = context
            .read<HomeBillsCubit>()
            .state
            .getReferredMonthBills(month)
            .isEmpty;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed:
                  isListEmpty ? null : () => _previousMonth(context, month),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
            Text(
              DateFormat('MMMM yyyy').format(month).capitalize(),
              style: context.textRobotoMediumToLarge,
            ),
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
    final currentPage = widget.pageController.page!.toInt();
    if (currentPage > 0) {
      widget.pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      final previousMonth = DateTime(month.year, month.month - 1);
      context.read<HomeBillsCubit>().onMonthCange(previousMonth);
    }
  }

  void _nextMonth(BuildContext context, DateTime month) {
    final currentPage = widget.pageController.page!.toInt();
    if (currentPage < widget.months.length - 1) {
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      final nextMonth = DateTime(month.year, month.month + 1);
      context.read<HomeBillsCubit>().onMonthCange(nextMonth);
    } else {
      context.navigateTo(Routes.home);
    }
  }
}
