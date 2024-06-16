// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
// import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';

// class PinCodeField extends StatelessWidget {
//   const PinCodeField({
//     super.key,
//     this.focusNode,
//     this.onChanged,
//     this.textInputAction = TextInputAction.next,
//     this.textFormKey,
//     this.controller,
//   });
//   final void Function(String)? onChanged;
//   final TextInputAction textInputAction;
//   final Key? textFormKey;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: context.height * 0.1,
//       width: context.width * 0.12,
//       child: Card(
//         child: TextFormField(
//           focusNode: focusNode,
//           key: textFormKey,
//           controller: controller,
//           onChanged: onChanged,
//           maxLength: 1,
//           maxLengthEnforcement: MaxLengthEnforcement.enforced,
//           keyboardType: TextInputType.number,
//           textInputAction: textInputAction,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           scribbleEnabled: false,
//           style: context.textTitleSmall,
//           decoration: InputDecoration(
//             counterText: '',
//             labelStyle: context.textRobotoSmall,
//             hintText: '*',
//             hintStyle: context.textRobotoSubtitleSmall,
//             // ignore: avoid_redundant_argument_values
//             errorMaxLines: null,
//             errorStyle: const TextStyle(
//               color: Colors.transparent,
//               height: 0.001,
//               fontSize: 0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
