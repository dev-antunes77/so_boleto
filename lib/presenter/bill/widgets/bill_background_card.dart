// import 'package:flutter/material.dart';
// import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
// import 'package:so_boleto/core/theme/extensions/size_extensions.dart';

// class BillBackgroundCard extends StatelessWidget {
//   const BillBackgroundCard({
//     super.key,
//     required this.child,
//   });

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return CustomSafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 22),
//         child: Center(
//           child: Card(
//             elevation: 6,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(12),
//               ),
//             ),
//             child: SizedBox(
//               width: context.width * 0.95,
//               height: context.height * 0.5,
//               child: child,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
