import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';
import 'package:so_boleto/domain/models/enums/category.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bill_model.dart';

part 'bill.g.dart';

@JsonSerializable()
class BillModel extends Equatable {
  BillModel({
    this.id = '',
    this.name = '',
    this.description = '',
    this.totalParcels = 1,
    this.value = 1,
    this.payedParcels = 0,
    this.hiveIndex = 0,
    this.dueDayOfTheMonth = 1,
    this.dueEveryMonth = false,
    Category? category,
    BillState? billState,
    DateTime? createdAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        category = category ?? Category.miscellaneous,
        billState = BillState.open;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillModelToJson(this);

  factory BillModel.fromHiveBillModel(HiveBillModel bill) => BillModel(
        id: bill.id,
        name: bill.name,
        description: bill.description,
        category: bill.category.textToEnum(),
        totalParcels: bill.totalParcels,
        payedParcels: bill.payedParcels,
        value: bill.value,
        dueDayOfTheMonth: bill.dueDayOfTheMonth,
        createdAt: bill.createdAt,
        hiveIndex: bill.hiveIndex,
      );

  final String id;
  final String name;
  final String description;
  final Category category;
  final int value;
  final DateTime createdAt;
  final int dueDayOfTheMonth;
  final BillState billState;
  final bool dueEveryMonth;
  final int totalParcels;
  final int payedParcels;
  final int hiveIndex;

  int get parcelsLeft => totalParcels - payedParcels;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        category,
        value,
        createdAt,
        billState,
        dueDayOfTheMonth,
        totalParcels,
        payedParcels,
        dueEveryMonth,
        hiveIndex,
      ];

  BillModel copyWith({
    String? id,
    String? name,
    String? description,
    Category? category,
    int? value,
    DateTime? createdAt,
    BillState? billState,
    int? dueDayOfTheMonth,
    int? totalParcels,
    int? payedParcels,
    bool? dueEveryMonth,
    int? hiveIndex,
  }) {
    return BillModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      billState: billState ?? this.billState,
      dueDayOfTheMonth: dueDayOfTheMonth ?? this.dueDayOfTheMonth,
      totalParcels: totalParcels ?? this.totalParcels,
      payedParcels: payedParcels ?? this.payedParcels,
      dueEveryMonth: dueEveryMonth ?? this.dueEveryMonth,
      hiveIndex: hiveIndex ?? this.hiveIndex,
    );
  }
}
