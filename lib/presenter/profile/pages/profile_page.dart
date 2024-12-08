import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_anchor.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_item_button.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
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

                  final navigationParams = _getNavigationParams(state.image);

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
                            // else if (state.image is XFile) {
                            //   return CircleAvatar(
                            //     radius: 36,
                            //     backgroundColor: themeColors.primary,
                            //     backgroundImage: FileImage(
                            //         File((state.image as XFile).path)),
                            //   );
                            // }
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
                      // if (state.image is XFile ||
                      //     _user.profilePicturePath.isNotEmpty)
                      CustomMenuItemButton(
                        svg: AppIcons.picture,
                        label: AppLocalizations.current.profileSeePicture,
                        onPressed: () => context.pushTo(
                          Routes.profileViewPicture,
                          params: navigationParams,
                        ),
                      ),
                      CustomMenuItemButton(
                        svg: AppIcons.camera,
                        label: AppLocalizations.current.profileTakePicture,
                        onPressed: () => _onCameraChoice(),
                      ),
                      CustomMenuItemButton(
                        svg: AppIcons.gallery,
                        label: AppLocalizations.current.profileSeeGallery,
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
          ProfileTitleSection(AppLocalizations.current.profilePreferences),
          ProfileOptionTile(
            label: AppLocalizations.current.profileTheme,
            subtitle: AppLocalizations.current.profileThemeText,
            onTap: () => context.pushTo(Routes.profileTheme),
            svg: AppIcons.paintRoll,
            color: themeColors.text,
          ),
          ProfileOptionTile(
            label: AppLocalizations.current.profileDueDay,
            subtitle: AppLocalizations.current.profileDueDayText,
            onTap: () => context.pushTo(Routes.profileDueDay),
            svg: AppIcons.calendar2,
            color: themeColors.text,
          ),
          ProfileOptionTile(
            label: AppLocalizations.current.profilePaymentTag,
            subtitle: AppLocalizations.current.profilePaymentTagText,
            onTap: () => context.pushTo(Routes.profilePayedTag),
            svg: AppIcons.tag,
            color: themeColors.text,
          ),
          const Divider(height: AppThemeValues.spaceXLarge),
          ProfileTitleSection(AppLocalizations.current.profileManagement),
          ProfileOptionTile(
            label: AppLocalizations.current.profileSecurity,
            onTap: () => context.pushTo(Routes.profileSecurity),
            svg: AppIcons.key,
            color: themeColors.text,
          ),
          ProfileOptionTile(
            label: AppLocalizations.current.profileLogout,
            onTap: () => AppDialogs.logOut(context, _user.name),
            svg: AppIcons.logout,
            color: themeColors.text,
          ),
        ],
      ),
    );
  }

  dynamic _getNavigationParams(dynamic image) =>
      // _user.profilePicturePath.isNotEmpty
      // ? ImageModel(path: _user.profilePicturePath)
      // : image is XFile
      //     ? ImageModel.fromXfile(image)
      // :
      const SizedBox.shrink();

  void _onCameraChoice() => _profileCubit.getImageFromCamera(
        context.read<InitialCubit>().onUpdateUserProfilePictrue,
      );

  void _onGalleryChoice() => _profileCubit.getImageFromGallery(
        context.read<InitialCubit>().onUpdateUserProfilePictrue,
      );
}
