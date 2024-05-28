// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/domain/models/bill.dart';

part 'hive_bill_model.g.dart';

@HiveType(typeId: 0)
final class HiveBillModel with HiveObjectMixin {
  HiveBillModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.totalParcels,
    required this.payedParcels,
    required this.value,
    required this.dueDayOfTheMonth,
    required this.createdAt,
    required this.hiveIndex,
  });

  factory HiveBillModel.fromBillModel(BillModel bill) => HiveBillModel(
        id: bill.id,
        name: bill.name,
        description: bill.description,
        category: bill.category.enumToText(),
        totalParcels: bill.totalParcels,
        payedParcels: bill.payedParcels,
        value: bill.value,
        dueDayOfTheMonth: bill.dueDayOfTheMonth,
        createdAt: bill.createdAt,
        hiveIndex: bill.hiveIndex,
      );

  @HiveField(1)
  String id;

  @HiveField(2)
  String name;

  @HiveField(3)
  String description;

  @HiveField(4)
  String category;

  @HiveField(6)
  int totalParcels;

  @HiveField(7)
  int payedParcels;

  @HiveField(8)
  int value;

  @HiveField(9)
  int dueDayOfTheMonth;

  @HiveField(10)
  DateTime createdAt;

  @HiveField(11)
  int hiveIndex;
}
