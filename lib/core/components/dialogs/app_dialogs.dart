import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/utils/system_overlay_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
import 'package:so_boleto/presenter/profile/cubit/profile_cubit.dart';

abstract class AppDialogs {
  static void leaveBillCreation(BuildContext context) => context.showDialog(
      title: AppLocalizations.current.dialogBillFlowLeaveBill,
      description: AppLocalizations.current.dialogBillFlowLeaveBillText,
      onAcept: () {
        GoRouter.of(context).pop(true);
        context.navigateTo(Routes.home);
      });

  static void leaveApp(BuildContext context) => context.showDialog(
        title: AppLocalizations.current.dialogLeaveApp,
        description: AppLocalizations.current.dialogLeaveAppText,
        onAcept: () => SystemNavigator.pop(),
      );

  static Future<bool> confirmDeleteBill(
          BuildContext context, BillModel bill) async =>
      context
          .showDialog(
              title: bill.name,
              description: AppLocalizations.current.dialogDeleteBill,
              onAcept: () {
                if (context.canPop()) {
                  GoRouter.of(context).pop(true);
                }
              })
          .then(
        (confirmed) {
          if (confirmed != null && confirmed) {
            return context.read<HomeBillsCubit>().deleteBill(bill.id);
          }
          return false;
        },
      );

  static Future<void> skipOnboarding(BuildContext context) =>
      context.showDialog(
        title: AppLocalizations.current.dialogOnboardingSkip,
        description: AppLocalizations.current.dialogOnboardingSkipText,
        onAcept: () {
          Navigator.of(context).pop(true);
          context.read<InitialCubit>().onSkipOnboarding().then(
                (_) => context.navigateTo(Routes.home),
              );
        },
      );

  static Future<void> logOut(BuildContext context, String userName) =>
      context.showDialog(
        title: AppLocalizations.current.dialogProfileLogout,
        description: AppLocalizations.current.dialogProfileLogoutText(userName),
        onAcept: () {
          context.read<ProfileCubit>().onLogout().then(
                (_) => context.navigateTo(Routes.login),
              );
        },
      );
}
