// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:so_boleto/core/components/custom_text_form_filed/custom_text_form_filed.dart';
// import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
// import 'package:so_boleto/core/l10n/generated/l10n.dart';
// import 'package:so_boleto/core/routes/routes.dart';
// import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
// import 'package:so_boleto/core/theme/settings/app_colors.dart';
// import 'package:so_boleto/core/theme/settings/app_icons.dart';
// import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
// import 'package:so_boleto/core/utils/form_validator.dart';
// import 'package:so_boleto/injection_service.dart';
// import 'package:so_boleto/presenter/login/bloc/login_cubit.dart';

// class LoginFormMsisdn extends StatefulWidget {
//   const LoginFormMsisdn({super.key});

//   @override
//   State<LoginFormMsisdn> createState() => _LoginFormMsisdnState();
// }

// class _LoginFormMsisdnState extends State<LoginFormMsisdn> {
//   late final LoginCubit _loginCubit;
//   final _formKey = GlobalKey<FormState>();
//   final _enableNextButton = ValueNotifier(false);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         _loginCubit = InjectionService.get<LoginCubit>();
//         return _loginCubit;
//       },
//       child: Column(
//         children: [
//           Text(
//             AppLocalizations.current.insertNumber,
//             style: context.textTitleSmall.copyWith(
//               color: AppColors.primary,
//             ),
//           ),
//           AppThemeValues.spaceVerticalMedium,
//           Form(
//             key: _formKey,
//             child: Card(
//               child: CustomTextFormField(
//                 hintText: AppLocalizations.current.subscribeHintNumber,
//                 keyboardType: TextInputType.number,
//                 onChanged: _onChangeMsisdn,
//                 validator: (msisdn) => FormValidator.validateMsisdn(msisdn),
//               ),
//             ),
//           ),
//           AppThemeValues.spaceVerticalHuge,
//           AppThemeValues.spaceVerticalHuge,
//           Align(
//             alignment: Alignment.centerRight,
//             child: ValueListenableBuilder(
//               valueListenable: _enableNextButton,
//               builder: (context, value, child) => FloatingActionButton(
//                 onPressed: _onTapNext,
//                 backgroundColor: value ? AppColors.primary : AppColors.primary,
//                 child: const SvgAsset(svg: AppIcons.money),
//               ),
//             ),
//           ),
//           RichText(
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               text: AppLocalizations.current.termsAndPolicies1,
//               style: context.textSmall,
//               children: [
//                 TextSpan(
//                   text: AppLocalizations.current.termsAndPolicies2,
//                   style: const TextStyle(
//                     decoration: TextDecoration.underline,
//                   ),
//                   recognizer: TapGestureRecognizer()..onTap = () {},
//                 ),
//                 TextSpan(
//                   text: AppLocalizations.current.termsAndPolicies3,
//                   style: const TextStyle(
//                     decoration: TextDecoration.underline,
//                   ),
//                   recognizer: TapGestureRecognizer()..onTap = () {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onChangeMsisdn(String value) {
//     _enableNextButton.value = _formKey.currentState!.validate();
//     _loginCubit.onChangeMsisdn(value);
//   }

//   void _onTapNext() {
//     if (_formKey.currentState!.validate()) {
//       context.pushTo(Routes.loginPinCode, params: _loginCubit);
//     }
//   }
// }
