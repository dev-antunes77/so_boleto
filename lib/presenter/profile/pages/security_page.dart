import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/theme/settings/theme_colors.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/presenter/profile/cubit/profile_cubit.dart';
import 'package:so_boleto/presenter/profile/pages/sections/grant_access_section.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_option_tile.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_title_sections.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  late final ProfileCubit _profileCubit;
  late final ThemeColors _themeColors;

  @override
  void initState() {
    _profileCubit = context.read<ProfileCubit>();
    _themeColors = context.read<ThemeCubit>().state.selectedColors;
    _profileCubit.allowAccess(denyAccess: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current.status == BaseStateStatus.focusedError,
      listener: (context, state) {
        if (state.allowSecurityAccess == false) {
          context.showSnackBar('Senha incorreta');
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.allowSecurityAccess) {
          return Padding(
            padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppThemeValues.spaceVerticalLarge,
                const ProfileTitleSection('Opções de segurança'),
                AppThemeValues.spaceVerticalXSmall,
                ProfileOptionTile(
                  label: 'Trocar senha',
                  onTap: () {},
                  svg: AppIcons.password,
                  color: _themeColors.text,
                ),
                AppThemeValues.spaceVerticalXSmall,
                ProfileOptionTile(
                  label: 'Deletar conta',
                  onTap: () {},
                  svg: AppIcons.delete2,
                  color: _themeColors.text,
                ),
                AppThemeValues.spaceVerticalImense,
                Center(
                  child: SvgAsset(
                    svg: AppIcons.security,
                    height: context.height * 0.3,
                    color: _themeColors.primary,
                    isMulticolor: true,
                  ),
                )
              ],
            ),
          );
        }

        return GrantAccessSection(
          themeColors: _themeColors,
          onConfirm: (paswword) =>
              _profileCubit.allowAccess(password: paswword),
        );
      },
    );
  }
}
