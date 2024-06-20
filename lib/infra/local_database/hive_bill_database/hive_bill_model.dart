// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:so_boleto/domain/models/bill.dart';

part 'hive_bill_model.g.dart';

@HiveType(typeId: 0)
final class HiveBillModel with HiveObjectMixin {
  HiveBillModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.billStatus,
    required this.totalParcels,
    required this.payedParcels,
    required this.value,
    required this.dueDayOfTheMonth,
    required this.createdAt,
  });

  factory HiveBillModel.fromBillModel(BillModel bill) => HiveBillModel(
        id: bill.id,
        name: bill.name,
        description: bill.description,
        category: bill.category.value,
        billStatus: bill.billStatus.value,
        totalParcels: bill.totalParcels,
        payedParcels: bill.payedParcels,
        value: bill.value,
        dueDayOfTheMonth: bill.dueDayOfTheMonth,
        createdAt: bill.createdAt,
      );

  static List<HiveBillModel> fromBillModelList(List<BillModel> bills) =>
      bills.map((bill) => HiveBillModel.fromBillModel(bill)).toList();

  @HiveField(1)
  String id;

  @HiveField(2)
  String name;

  @HiveField(3)
  String description;

  @HiveField(4)
  String category;

  @HiveField(5)
  String billStatus;

  @HiveField(7)
  int totalParcels;

  @HiveField(8)
  int payedParcels;

  @HiveField(9)
  int value;

  @HiveField(10)
  int dueDayOfTheMonth;

  @HiveField(11)
  DateTime createdAt;
}
