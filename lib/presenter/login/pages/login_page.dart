// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:so_boleto/core/components/buttons/pill_button.dart';
// import 'package:so_boleto/core/components/status_page/pages/loading_page.dart';
// import 'package:so_boleto/core/components/status_page/pages/no_connection_page.dart';
// import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
// import 'package:so_boleto/core/l10n/generated/l10n.dart';
// import 'package:so_boleto/core/routes/routes.dart';
// import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
// import 'package:so_boleto/core/theme/settings/app_icons.dart';
// import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
// import 'package:so_boleto/core/utils/base_state.dart';
// import 'package:so_boleto/presenter/login/bloc/login_cubit.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LoginCubit, LoginState>(
//       listener: (context, state) {
//         if (state.status == BaseStateStatus.success) {
//           context.navigateTo(Routes.home);
//         } else if (state.status == BaseStateStatus.error) {
//           context.showSnackBar(state.callbackMessage);
//         }
//       },
//       builder: (context, state) => state.when(
//         onState: (_) => Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: AppThemeValues.spaceImense,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const SvgAsset(svg: AppIcons.money),
//               Column(
//                 children: [
//                   Text(
//                     '',
//                     style: context.textSubtitleLarge,
//                     textAlign: TextAlign.center,
//                   ),
//                   AppThemeValues.spaceVerticalMedium,
//                   Text(
//                     '',
//                     style: context.textSubtitleSmall,
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//               PillButton(
//                 onTap: context.read<LoginCubit>().onSignIn,
//                 child: Text(AppLocalizations.current.signIn),
//               )
//             ],
//           ),
//         ),
//         onLoading: () => const LoadingPage(),
//         onNoConnection: () => NoConnectionPage(
//           onTap: context.read<LoginCubit>().onSignIn,
//         ),
//       ),
//     );
//   }
// }
