import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_anchor.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_item_button.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/image_model.dart';
import 'package:so_boleto/domain/models/user_data.dart';
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
  late UserData _user;
  @override
  void initState() {
    _profileCubit = context.read<ProfileCubit>();
    _user = context.read<InitialCubit>().state.user!;
    _profileCubit.onInit(_user.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = context.watch<ThemeCubit>().state.selectedColors;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceXSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppThemeValues.spaceVerticalSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  _user = context.read<InitialCubit>().state.user!;

                  final navigationParams = _user.profilePicturePath.isNotEmpty
                      ? ImageModel(path: _user.profilePicturePath)
                      : ImageModel.fromXfile(state.image as XFile);
                  return CustomMenuAnchor(
                    alignment: Alignment.topRight,
                    builder: (context, controller, child) {
                      return GestureDetector(
                        onTap: () => controller.isOpen
                            ? controller.close()
                            : controller.open(),
                        child: Builder(
                          builder: (context) {
                            if (_user.profilePicturePath.isNotEmpty) {
                              return CircleAvatar(
                                radius: 36,
                                backgroundColor: themeColors.primary,
                                backgroundImage:
                                    FileImage(File(_user.profilePicturePath)),
                              );
                            }
                            if (state.image is XFile) {
                              return CircleAvatar(
                                radius: 36,
                                backgroundColor: themeColors.primary,
                                backgroundImage: FileImage(
                                    File((state.image as XFile).path)),
                              );
                            }
                            return CircleAvatar(
                              radius: 36,
                              backgroundColor: themeColors.primary,
                              child: const SvgAsset(
                                svg: AppIcons.money,
                                height: 52,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    menuChildren: [
                      if (state.image is XFile ||
                          _user.profilePicturePath.isNotEmpty)
                        CustomMenuItemButton(
                          svg: AppIcons.picture,
                          label: 'Ver foto',
                          onPressed: () => context.pushTo(
                            Routes.profileViewPicture,
                            params: navigationParams,
                          ),
                        ),
                      CustomMenuItemButton(
                        svg: AppIcons.camera,
                        label: 'tirar foto',
                        onPressed: () => _onCameraChoice(),
                      ),
                      CustomMenuItemButton(
                        svg: AppIcons.gallery,
                        label: 'Galeria',
                        onPressed: () => _onGalleryChoice(),
                      ),
                    ],
                  );
                },
              ),
              AppThemeValues.spaceHorizontalMedium,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user.userName,
                    style: context.textRobotoSubtitleMedium,
                  ),
                  Text(
                    _user.email,
                    style: context.textRobotoSmall,
                  ),
                ],
              )
            ],
          ),
          const Divider(height: AppThemeValues.spaceXLarge),
          const ProfileTitleSection('Preferências'),
          ProfileOptionTile(
            label: 'Tema',
            subtitle: 'Temas e cores do seu app',
            onTap: () => context.pushTo(Routes.profileTheme),
            svg: AppIcons.paintRoll,
            color: themeColors.text,
          ),
          ProfileOptionTile(
            label: 'Vencimento',
            subtitle: 'Dia preferido para suas contas vencerem',
            onTap: () => context.pushTo(Routes.profileDueDay),
            svg: AppIcons.calendar2,
            color: themeColors.text,
          ),
          ProfileOptionTile(
            label: 'Marca de pagamento',
            subtitle: 'Tag para as contas marcadas como pagas',
            onTap: () => context.pushTo(Routes.profilePayedTag),
            svg: AppIcons.tag,
            color: themeColors.text,
          ),
          const Divider(height: AppThemeValues.spaceXLarge),
          const ProfileTitleSection('Gerenciamento'),
          ProfileOptionTile(
            label: 'Segurança',
            onTap: () => context.pushTo(Routes.profileSecurity),
            svg: AppIcons.key,
            color: themeColors.text,
          ),
          ProfileOptionTile(
            label: 'Sair',
            onTap: _onLogoutPressed,
            svg: AppIcons.logout,
            color: themeColors.text,
          ),
        ],
      ),
    );
  }

  void _onCameraChoice() {
    _profileCubit.getImageFromCamera(
        context.read<InitialCubit>().onUpdateUserProfilePictrue);
  }

  void _onGalleryChoice() {
    _profileCubit.getImageFromGallery(
        context.read<InitialCubit>().onUpdateUserProfilePictrue);
  }

  void _onLogoutPressed() => context.showDialog(
        title: 'Sair?',
        description: 'Tem certeza que deseja deslogar deslogar, ${_user.name}?',
        onAcept: () {
          _profileCubit.onLogout().then(
                (_) => context.navigateTo(Routes.login),
              );
        },
      );
}
