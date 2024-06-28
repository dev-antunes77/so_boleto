import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_images.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
import 'package:so_boleto/presenter/profile/cubit/profile_cubit.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_option_tile.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_title_sections.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit _profileCubit;

  @override
  void initState() {
    _profileCubit = context.read<ProfileCubit>();
    _profileCubit.onInit(context.read<InitialCubit>().state.user!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceXSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileTitleSection('Meu perfil'),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(AppImages.logo),
            ),
            title: Text('Nome completo aqui',
                style: context.textRobotoSubtitleMedium),
            subtitle: const Text('email@example.com.br'),
          ),
          const Divider(height: AppThemeValues.spaceXLarge),
          const ProfileOptionTile(
            label: 'Ação número 1',
            subtitle: 'Something else',
            route: '',
          ),
          const ProfileOptionTile(
            label: 'Ação número 2',
            subtitle: 'Something else',
            route: '',
          ),
          const ProfileOptionTile(
            label: 'Ação número 3',
            subtitle: 'Something else',
            route: '',
          ),
          const ProfileOptionTile(
            label: 'Preferências',
            subtitle: 'Custumize suas preferências',
            route: Routes.profilePreferences,
          ),
          Center(
            child: PillButton(
              onTap: _onLogoutPressed,
              child: Text(
                'Sair',
                style: context.textRobotoSmall.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onLogoutPressed() => context.showDialog(
        title: 'Sair?',
        description:
            'Tem certeza que deseja deslogar deslogar, ${_profileCubit.state.user.name}?',
        onAcept: () {
          _profileCubit.onLogout().then(
                (_) => context.navigateTo(Routes.login),
              );
        },
      );
}
