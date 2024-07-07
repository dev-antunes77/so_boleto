// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:so_boleto/core/extensions/color_extensions.dart';
import 'package:so_boleto/domain/models/user_data.dart';

part 'hive_user_data.g.dart';

@HiveType(typeId: 1)
class HiveUserData with HiveObjectMixin {
  HiveUserData({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.hasSeenOnboarding,
    required this.hasLightTheme,
    required this.payedTag,
    required this.billSorting,
    required this.hasInvertedSorting,
    required this.baseColor,
    required this.favoredDueDay,
    required this.profilePicturePath,
    required this.createdAt,
  });

  factory HiveUserData.fromUserModel(UserData user) => HiveUserData(
        id: user.id,
        name: user.name,
        lastName: user.lastName,
        email: user.email,
        password: user.password,
        hasLightTheme: user.hasLightTheme,
        hasSeenOnboarding: user.hasSeenOnboarding,
        payedTag: user.payedTag.value,
        billSorting: user.billSorting.kind,
        hasInvertedSorting: user.hasInvertedSorting,
        favoredDueDay: user.favoredDueDay,
        profilePicturePath: user.profilePicturePath,
        baseColor: user.baseColor.colorToJson(),
        createdAt: user.createdAt,
      );

  @HiveField(1)
  final String id;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String lastName;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String password;

  @HiveField(6)
  final bool hasSeenOnboarding;

  @HiveField(7)
  final bool hasLightTheme;

  @HiveField(8)
  final String payedTag;

  @HiveField(9)
  final String billSorting;

  @HiveField(10)
  final bool hasInvertedSorting;

  @HiveField(11)
  final String baseColor;

  @HiveField(12)
  final int favoredDueDay;

  @HiveField(13)
  final String profilePicturePath;

  @HiveField(14)
  final DateTime createdAt;
}
