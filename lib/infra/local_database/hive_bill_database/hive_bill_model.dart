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
    required this.totalParcels,
    required this.payedParcels,
    required this.value,
    required this.dueDay,
    required this.createdAt,
  });

  factory HiveBillModel.fromBillModel(BillModel bill) => HiveBillModel(
        id: bill.id,
        name: bill.name,
        description: bill.description,
        category: bill.category.value,
        totalParcels: bill.totalParcels,
        payedParcels: bill.payedParcels,
        value: bill.value,
        dueDay: bill.dueDay,
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
  int totalParcels;

  @HiveField(6)
  int payedParcels;

  @HiveField(7)
  int value;

  @HiveField(8)
  int dueDay;

  @HiveField(9)
  DateTime createdAt;
}
