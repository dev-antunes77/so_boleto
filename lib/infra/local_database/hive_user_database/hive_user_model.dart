// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:so_boleto/domain/models/user.dart';

@HiveType(typeId: 1)
final class HiveUserModel extends UserModel with HiveObjectMixin {
  HiveUserModel({
    required super.userId,
    required super.name,
    required super.lastName,
    required super.email,
    required super.password,
    required super.createdAt,
    required super.hasSeenOnbording,
  });

  factory HiveUserModel.fromUserModel(UserModel user) => HiveUserModel(
        userId: user.userId,
        name: user.name,
        lastName: user.lastName,
        email: user.email,
        password: user.password,
        createdAt: user.createdAt,
        hasSeenOnbording: user.hasSeenOnbording,
      );

  @override
  @HiveField(1)
  String get userId => super.userId;

  @override
  @HiveField(2)
  String get name => super.name;

  @override
  @HiveField(3)
  String get lastName => super.lastName;

  @override
  @HiveField(4)
  String get email => super.email;

  @override
  @HiveField(6)
  String get password => super.password;

  @override
  @HiveField(7)
  bool get hasSeenOnbording => super.hasSeenOnbording;

  @override
  @HiveField(8)
  DateTime get createdAt => super.createdAt;
}
