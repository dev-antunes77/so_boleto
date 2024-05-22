// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:so_boleto/core/components/status_page/pages/loading_page.dart';
// import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
// import 'package:so_boleto/core/l10n/generated/l10n.dart';
// import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
// import 'package:so_boleto/core/theme/settings/app_colors.dart';
// import 'package:so_boleto/core/theme/settings/app_icons.dart';
// import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
// import 'package:so_boleto/core/utils/form_validator.dart';
// import 'package:so_boleto/presenter/login/bloc/login_cubit.dart';
// import 'package:so_boleto/presenter/login/widgets/pin_code_field.dart';

// class LoginFormPinCode extends StatefulWidget {
//   const LoginFormPinCode({super.key, required this.loginCubit});

//   final LoginCubit loginCubit;

//   @override
//   State<LoginFormPinCode> createState() => _LoginFormPinCodeState();
// }

// class _LoginFormPinCodeState extends State<LoginFormPinCode> {
//   final digitKeys = [
//     GlobalKey<FormFieldState>(),
//     GlobalKey<FormFieldState>(),
//     GlobalKey<FormFieldState>(),
//     GlobalKey<FormFieldState>(),
//   ];

//   final controllers = [
//     TextEditingController(),
//     TextEditingController(),
//     TextEditingController(),
//     TextEditingController(),
//   ];

//   final focusNodes = [
//     FocusNode(),
//     FocusNode(),
//     FocusNode(),
//     FocusNode(),
//   ];

//   var enableNextButtonNotifier = ValueNotifier(false);

//   @override
//   void dispose() {
//     for (var node in focusNodes) {
//       node.dispose();
//     }
//     for (var controller in controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(
//       buildWhen: (previous, current) => previous.status != current.status,
//       builder: (context, state) => state.when(
//         onState: (_) => Column(
//           children: [
//             RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 text: AppLocalizations.current.loginPincodeInsert,
//                 style: context.textTitleSmall.copyWith(
//                   fontWeight: FontWeight.w800,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: widget.loginCubit.state.msisdn,
//                     style: TextStyle(color: AppColors.primary),
//                   ),
//                 ],
//               ),
//             ),
//             AppThemeValues.spaceVerticalXXSmall,
//             Text(AppLocalizations.current.loginPincodeInfo),
//             AppThemeValues.spaceVerticalMedium,
//             Align(
//               alignment: Alignment.topRight,
//               child: Form(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     PinCodeField(
//                         focusNode: focusNodes[0],
//                         textFormKey: digitKeys[0],
//                         controller: controllers[0],
//                         onChanged: (digit) => _onChangePinCodeDigit(digit, 0)),
//                     AppThemeValues.spaceHorizontalMedium,
//                     PinCodeField(
//                         focusNode: focusNodes[1],
//                         textFormKey: digitKeys[1],
//                         controller: controllers[1],
//                         onChanged: (digit) => _onChangePinCodeDigit(digit, 1)),
//                     AppThemeValues.spaceHorizontalMedium,
//                     PinCodeField(
//                       focusNode: focusNodes[2],
//                       textFormKey: digitKeys[2],
//                       controller: controllers[2],
//                       onChanged: (digit) => _onChangePinCodeDigit(digit, 2),
//                     ),
//                     AppThemeValues.spaceHorizontalMedium,
//                     PinCodeField(
//                         focusNode: focusNodes[3],
//                         textFormKey: digitKeys[3],
//                         controller: controllers[3],
//                         textInputAction: TextInputAction.done,
//                         onChanged: (digit) => _onChangePinCodeDigit(digit, 3))
//                   ],
//                 ),
//               ),
//             ),
//             AppThemeValues.spaceVerticalHuge,
//             Align(
//               alignment: Alignment.centerRight,
//               child: ValueListenableBuilder(
//                 valueListenable: enableNextButtonNotifier,
//                 builder: (context, enableNextButton, state) {
//                   return FloatingActionButton(
//                     onPressed: widget.loginCubit.onSignIn,
//                     backgroundColor: enableNextButton
//                         ? AppColors.primary
//                         : AppColors.primary,
//                     child: const SvgAsset(svg: AppIcons.money),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//         onLoading: () => const LoadingPage(),
//       ),
//     );
//   }

//   void _onChangePinCodeDigit(String digit, int position) {
//     final bool isValid = controllers.every((controller) =>
//         FormValidator.validatePinCodeDigit(controller.text) == null);

//     if (digit.isNotEmpty) {
//       if (position < focusNodes.length - 1) {
//         FocusScope.of(context).requestFocus(focusNodes[position + 1]);
//       } else {
//         if (isValid) {
//           FocusScope.of(context).unfocus();
//         }
//       }
//     }

//     enableNextButtonNotifier.value = isValid;
//     widget.loginCubit.onChangePinCode(digit, position);
//   }
// }
