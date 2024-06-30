import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_payed_tag/payed_tag_selector.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class PayedTagChoice extends StatelessWidget {
  const PayedTagChoice({super.key});

  @override
  Widget build(BuildContext context) {
    final tagChoiceBill = BillModel(
      name: 'Exemplo',
      value: 0,
      userId: '',
      billStatus: BillStatus.payed,
    );

    List<PaymentTagChoiceTile> paymentTagOptions = [
      PaymentTagChoiceTile(
        tagChoiceBill: tagChoiceBill,
        label: 'Carimbo',
        tag: PayedTag.stample,
      ),
      PaymentTagChoiceTile(
        tagChoiceBill: tagChoiceBill,
        label: 'Check na borda',
        tag: PayedTag.check,
      ),
      PaymentTagChoiceTile(
        tagChoiceBill: tagChoiceBill,
        label: 'Barra lateral',
        tag: PayedTag.sideBar,
      ),
      PaymentTagChoiceTile(
        tagChoiceBill: tagChoiceBill,
        label: 'Barra inferior',
        tag: PayedTag.bottomBar,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(
            AppThemeValues.spaceXSmall,
          ),
          child: Text(
            'Selecione a tag de pagamento que melhor se adapte a você',
            style: context.textRobotoSubtitleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        AppThemeValues.spaceVerticalMedium,
        ListView.separated(
          itemCount: paymentTagOptions.length,
          separatorBuilder: (context, index) =>
              AppThemeValues.spaceVerticalMassive,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => paymentTagOptions[index],
        )
      ],
    );
  }
}

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
                  tagChoiceBill,
                  payedTagSelector: PayedTagSelector(
                    tagChoiceBill.billStatus.isPayed,
                    payedTag: tag,
                  ),
                  isTagPreferenceScreen: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ConvexCarousel extends StatefulWidget {
  final List<Widget> items;
  const ConvexCarousel({super.key, required this.items});
  @override
  State<ConvexCarousel> createState() => _ConvexCarouselState();
}

class _ConvexCarouselState extends State<ConvexCarousel> {
  late PageController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    _controller =
        PageController(initialPage: _currentIndex, viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
              controller: _controller,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                double scale = index == _currentIndex ? 1.0 : 0.6;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.identity()..scale(scale),
                  child: Center(
                    child: widget.items[index],
                  ),
                );
              },
              onPageChanged: (index) => setState(() => _currentIndex = index)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
              child: const Text('Previous'),
            ),
            ElevatedButton(
              onPressed: () {
                if ((_controller.page! + 1.0) == widget.items.length) {
                  _controller.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                } else {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                }
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
