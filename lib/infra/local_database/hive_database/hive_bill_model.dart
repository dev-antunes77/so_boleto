// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/category.dart';

part 'hive_bill_model.g.dart';

@HiveType(typeId: 0)
final class HiveBillModel extends BillModel with HiveObjectMixin {
  HiveBillModel({
    required super.id,
    required super.name,
    required super.description,
    required super.category,
    required super.totalParcels,
    required super.payedParcels,
    required super.value,
    required super.dueDate,
    required super.createdAt,
    required super.hiveIndex,
  });

  factory HiveBillModel.fromBillModel(BillModel bill) => HiveBillModel(
        id: bill.id,
        name: bill.name,
        description: bill.description,
        category: bill.category,
        totalParcels: bill.totalParcels,
        payedParcels: bill.payedParcels,
        value: bill.value,
        dueDate: bill.dueDate,
        createdAt: bill.createdAt,
        hiveIndex: bill.hiveIndex,
      );

  @override
  @HiveField(1)
  String get id => super.id;

  @override
  @HiveField(2)
  String get name => super.name;

  @override
  @HiveField(3)
  String get description => super.description;

  @override
  @HiveField(4)
  Category get category => super.category;

  @override
  @HiveField(6)
  int get totalParcels => super.totalParcels;

  @override
  @HiveField(7)
  int get payedParcels => super.payedParcels;

  @override
  @HiveField(8)
  int get value => super.value;

  @override
  @HiveField(9)
  DateTime get dueDate => super.dueDate;

  @override
  @HiveField(10)
  DateTime get createdAt => super.createdAt;

  @override
  @HiveField(11)
  int get hiveIndex => super.hiveIndex;
}
