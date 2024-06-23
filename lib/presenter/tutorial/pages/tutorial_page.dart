import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_images.dart';
import 'package:so_boleto/presenter/tutorial/widgets/tutorial_bottom_navigator.dart';

class TutotialPage extends StatefulWidget {
  const TutotialPage({super.key});

  @override
  State<TutotialPage> createState() => _TutotialPageState();
}

class _TutotialPageState extends State<TutotialPage> {
  final _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 4,
                allowImplicitScrolling: false,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TutorialImageCard(
                        label: 'Conta não paga',
                        image: AppImages.payment1,
                      ),
                      TutorialImageCard(
                        label: 'Arraste para a esquerda\npara apagar a conta',
                        image: AppImages.payment4,
                      ),
                    ],
                  );
                },
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TutorialPageIndicator(hasOpacity: currentPage != 0),
            //     TutorialPageIndicator(hasOpacity: currentPage != 1),
            //     TutorialPageIndicator(hasOpacity: currentPage != 2),
            //     TutorialPageIndicator(hasOpacity: currentPage != 3),
            //   ],
            // ),
          ],
        ),
        bottomNavigationBar:
            TutorialBottomNavigator(pageController: _pageController),
      ),
    );
  }
}

class TutorialImageCard extends StatelessWidget {
  const TutorialImageCard({
    super.key,
    required this.label,
    required this.image,
  });

  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: context.textRobotoSmall,
          textAlign: TextAlign.center,
        ),
        Image.asset(image, height: 100),
      ],
    );
  }
}


// class TutotialPage extends StatefulWidget {
//   const TutotialPage({super.key});

//   @override
//   State<TutotialPage> createState() => _TutotialPageState();
// }

// class _TutotialPageState extends State<TutotialPage> {
//   final _pageController = PageController();
//   @override
//   void initState() {
//     super.initState();
//   }

//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.primaryBackground,
//         body: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 itemCount: 4,
//                 allowImplicitScrolling: false,
//                 controller: _pageController,
//                 itemBuilder: (context, index) {
//                   return const Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       TutorialImageCard(
//                         label: 'Conta não paga',
//                         image: AppImages.payment1,
//                       ),
//                       // TutorialImageCard(
//                       //   label:
//                       //       'Arraste para a direita\npara registrar a conta como paga',
//                       //   image: AppImages.payment2,
//                       // ),
//                       TutorialImageCard(
//                         label: 'Arraste para a esquerda\npara apagar a conta',
//                         image: AppImages.payment4,
//                       ),
//                       // TutorialImageCard(
//                       //   label: 'Conta paga',
//                       //   image: AppImages.payment3,
//                       // ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TutorialPageIndicator(hasOpacity: currentPage != 0),
//                 TutorialPageIndicator(hasOpacity: currentPage != 1),
//                 TutorialPageIndicator(hasOpacity: currentPage != 2),
//                 TutorialPageIndicator(hasOpacity: currentPage != 3),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomTextButton(
//                   label: 'Voltar',
//                   disable: currentPage == 0,
//                   onPressed: _onPriviousPage,
//                 ),
//                 CustomTextButton(
//                   label: 'Próximo',
//                   onPressed: _onNextPage,
//                 ),
//               ],
//             ),
//             AppThemeValues.spaceVerticalXXSmall,
//           ],
//         ),
//       ),
//     );
//   }

//   void _onNextPage() {
//     setState(() => currentPage++);
//     _pageController.nextPage(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.bounceOut,
//     );
//   }

//   void _onPriviousPage() {
//     setState(() => currentPage--);
//     _pageController.previousPage(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.bounceOut,
//     );
//   }
// }

// class TutorialPageIndicator extends StatelessWidget {
//   const TutorialPageIndicator({
//     super.key,
//     required this.hasOpacity,
//   });

//   final bool hasOpacity;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(3.0),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: hasOpacity
//               ? AppColors.primary.withOpacity(0.5)
//               : AppColors.primary,
//           shape: BoxShape.circle,
//         ),
//         child: SizedBox.square(dimension: hasOpacity ? 10 : 12),
//       ),
//     );
//   }
// }

// class TutorialImageCard extends StatelessWidget {
//   const TutorialImageCard({
//     super.key,
//     required this.label,
//     required this.image,
//   });

//   final String label;
//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           label,
//           style: context.textRobotoSmall,
//           textAlign: TextAlign.center,
//         ),
//         Image.asset(image, height: 100),
//       ],
//     );
//   }
// }
