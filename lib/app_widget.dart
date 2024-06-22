import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/route_config.dart';
import 'package:so_boleto/core/theme/settings/theme_config.dart';
import 'package:so_boleto/injection_service.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/expenses/cubit/expenses_cubit.dart';
import 'package:so_boleto/presenter/filter/cubit/filter_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
import 'package:so_boleto/presenter/profile/cubit/profile_cubit.dart';
import 'package:so_boleto/presenter/prompt_bills/cubit/prompt_bills_cubit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InjectionService.get<InitialCubit>()),
        BlocProvider(create: (_) => InjectionService.get<HomeBillsCubit>()),
        BlocProvider(create: (_) => InjectionService.get<BillCubit>()),
        BlocProvider(create: (_) => InjectionService.get<FilterCubit>()),
        BlocProvider(create: (_) => InjectionService.get<PromptBillsCubit>()),
        BlocProvider(create: (_) => InjectionService.get<ExpensesCubit>()),
        BlocProvider(create: (_) => InjectionService.get<ProfileCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeSettings.light(),
        darkTheme: ThemeSettings.dark(),
        themeMode: ThemeMode.light,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        routerConfig: RoutesConfig.router,
      ),
    );
  }
}
