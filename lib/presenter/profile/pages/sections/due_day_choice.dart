import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_title_sections.dart';

class DueDayChoice extends StatefulWidget {
  const DueDayChoice({super.key});

  @override
  State<DueDayChoice> createState() => _DueDayChoiceState();
}

class _DueDayChoiceState extends State<DueDayChoice> {
  int _dueDay = 0;

  _onDueDayChange(int newDay) => setState(() => _dueDay = newDay);

  @override
  Widget build(BuildContext context) {
    final color = context.read<ThemeCubit>().state.selectedColors.tag;
    return Column(
      children: [
        ProfileTitleSection(
            AppLocalizations.current.profileDueDayPageChooseDueDay),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppThemeValues.spaceLarge),
          child: Column(
            children: [
              Text(
                AppLocalizations.current.profileDueDayPageTitle,
                textAlign: TextAlign.center,
              ),
              AppThemeValues.spaceVerticalSmall,
              Text(
                AppLocalizations.current.profileDueDayPageSubtitle,
                textAlign: TextAlign.center,
              ),
              AppThemeValues.spaceVerticalMassive,
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: AppThemeValues.spaceTiny,
                  mainAxisSpacing: AppThemeValues.spaceTiny,
                ),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppConstants.monthDays.length,
                itemBuilder: (context, index) {
                  final day = AppConstants.monthDays[index];
                  return GestureDetector(
                    onTap: () => _onDueDayChange(day),
                    child: Card(
                      color: _dueDay == day ? color : null,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text('$day'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        AppThemeValues.spaceVerticalMassive,
        PillButton(
          onTap: () {
            context.read<InitialCubit>().onUpdateUserFavoredDueDay(_dueDay);
            context.pop(true);
          },
          isDisabled: _dueDay < 1,
          child: Text(AppLocalizations.current.done),
        ),
      ],
    );
  }
}
