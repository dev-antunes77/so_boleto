import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/utils/system_overlay_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

abstract class AppDialogs {
  static void leaveBillCreation(BuildContext context) => context.showDialog(
      title: 'Tem certeza?',
      description: 'Se sair,\na criação dessa conta será perdida.',
      onAcept: () {
        GoRouter.of(context).pop(true);
        context.navigateTo(Routes.home);
      });

  static void leaveApp(BuildContext context) => context.showDialog(
        title: 'Sair do app?',
        description: 'Tem certeza que deseja\nsair do app?',
        onAcept: () => SystemNavigator.pop(),
      );

  static Future<bool> confirmDeleteBill(
          BuildContext context, BillModel bill) async =>
      context
          .showDialog(
              title: bill.name,
              description: 'Deseja mesmo deletar essa conta?',
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
}
