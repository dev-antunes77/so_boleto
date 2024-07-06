// import 'package:flutter/material.dart';
// import 'package:so_boleto/core/theme/settings/app_colors.dart';

// class LoadingPage extends StatefulWidget {
//   final Duration duration;
//   final Icon dotIcon;

//   const LoadingPage(
//       {super.key,
//       this.duration = const Duration(milliseconds: 1500),
//       this.dotIcon = const Icon(
//         Icons.blur_on,
//       )});

//   @override
//   State<LoadingPage> createState() => _LoadingPageState();
// }

// class _LoadingPageState extends State<LoadingPage>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> animation1;
//   late Animation<double> animation2;
//   late Animation<double> animation3;
//   late Animation<double> animation4;
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(duration: widget.duration, vsync: this);

//     animation1 = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.1, 0.50, curve: Curves.linear),
//       ),
//     );
//     animation2 = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.1, 0.65, curve: Curves.linear),
//       ),
//     );
//     animation3 = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.1, 0.80, curve: Curves.linear),
//       ),
//     );

//     animation4 = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.2, 0.95, curve: Curves.linear),
//       ),
//     );

//     controller.addListener(() {
//       setState(() {
//         //print(animation_1.value);
//       });
//     });

//     controller.repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Opacity(
//           opacity: (animation1.value <= 0.4
//               ? 2.5 * animation1.value
//               : (animation1.value > 0.40 && animation1.value <= 0.60)
//                   ? 1.0
//                   : 2.5 - (2.5 * animation1.value)),
//           child: Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Dot(
//               radius: 10.0,
//               color: AppColors.primary,
//               icon: widget.dotIcon,
//             ),
//           ),
//         ),
//         Opacity(
//           opacity: (animation2.value <= 0.4
//               ? 2.5 * animation2.value
//               : (animation2.value > 0.40 && animation2.value <= 0.60)
//                   ? 1.0
//                   : 2.5 - (2.5 * animation2.value)),
//           child: Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Dot(
//               radius: 10.0,
//               color: AppColors.primary,
//               icon: widget.dotIcon,
//             ),
//           ),
//         ),
//         Opacity(
//           opacity: (animation3.value <= 0.4
//               ? 2.5 * animation3.value
//               : (animation3.value > 0.40 && animation3.value <= 0.60)
//                   ? 1.0
//                   : 2.5 - (2.5 * animation3.value)),
//           child: Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Dot(
//               radius: 10.0,
//               color: AppColors.primary,
//               icon: widget.dotIcon,
//             ),
//           ),
//         ),
//         Opacity(
//           opacity: (animation4.value <= 0.4
//               ? 2.5 * animation4.value
//               : (animation4.value > 0.40 && animation4.value <= 0.60)
//                   ? 1.0
//                   : 2.5 - (2.5 * animation4.value)),
//           child: Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Dot(
//               radius: 10.0,
//               color: AppColors.primary,
//               icon: widget.dotIcon,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// class Dot extends StatelessWidget {
//   final double? radius;
//   final Color? color;
//   final Icon? icon;

//   const Dot({super.key, this.radius, this.color, this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: 0.0,
//       child: Container(
//         width: radius,
//         height: radius,
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }
