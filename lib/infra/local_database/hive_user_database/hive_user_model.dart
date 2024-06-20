// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bill_model.dart';

part 'hive_user_model.g.dart';

@HiveType(typeId: 1)
final class HiveUserModel with HiveObjectMixin {
  HiveUserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.bills,
    required this.hasSeenOnbording,
  });

  factory HiveUserModel.fromUserModel(UserModel user) => HiveUserModel(
        id: user.id,
        name: user.name,
        lastName: user.lastName,
        email: user.email,
        password: user.password,
        createdAt: user.createdAt,
        bills: HiveBillModel.fromBillModelList(user.bills),
        hasSeenOnbording: user.hasSeenOnbording,
      );

  @HiveField(1)
  String id;

  @HiveField(2)
  String name;

  @HiveField(3)
  String lastName;

  @HiveField(4)
  String email;

  @HiveField(5)
  String password;

  @HiveField(6)
  List<HiveBillModel> bills;

  @HiveField(7)
  bool hasSeenOnbording;

  @HiveField(8)
  DateTime createdAt;
}
