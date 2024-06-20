import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:so_boleto/core/extensions/date_time_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bill_model.dart';

part 'bill.g.dart';

@JsonSerializable()
class BillModel extends Equatable {
  BillModel({
    this.name = '',
    this.description = '',
    this.totalParcels = 0,
    this.value = 0,
    this.payedParcels = 0,
    this.dueDayOfTheMonth = 0,
    String? id,
    BillCategory? category,
    BillStatus? billStatus,
    DateTime? createdAt,
  })  : id = id ?? AppFormatters.randomIdFormater(),
        createdAt = createdAt ?? DateTime.now(),
        category = category ?? BillCategory.miscellaneous,
        billStatus = billStatus ?? BillStatus.open;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillModelToJson(this);

  Map<String, dynamic> toFirestore() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'category': category.value,
        'billStatus': billStatus.value,
        'value': value,
        'totalParcels': totalParcels,
        'payedParcels': payedParcels,
        'dueDay': dueDayOfTheMonth,
        'createdAt': createdAt.dateTimeToStringData(),
      };

  factory BillModel.fromHiveBillModel(HiveBillModel bill) => BillModel(
        id: bill.id,
        name: bill.name,
        description: bill.description,
        category: bill.category.categoryToEnum(),
        billStatus: bill.billStatus.billStatuToEnum(),
        totalParcels: bill.totalParcels,
        payedParcels: bill.payedParcels,
        value: bill.value,
        dueDayOfTheMonth: bill.dueDayOfTheMonth,
        createdAt: bill.createdAt,
      );

  factory BillModel.fromPromptToBill(PromptBill promptBill) => BillModel(
        id: promptBill.id,
        name: promptBill.name,
        description: '',
        category: promptBill.category,
        billStatus: BillStatus.open,
        totalParcels: 0,
        payedParcels: 0,
        value: promptBill.value,
        dueDayOfTheMonth: promptBill.dueDay,
        createdAt: DateTime.now(),
      );

  final String id;
  final String name;
  final String description;
  final BillCategory category;
  final int value;
  final DateTime createdAt;
  final int dueDayOfTheMonth;
  final BillStatus billStatus;
  final int totalParcels;
  final int payedParcels;

  int get parcelsLeft => totalParcels - payedParcels;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        category,
        value,
        createdAt,
        dueDayOfTheMonth,
        billStatus,
        totalParcels,
        payedParcels,
      ];

  BillModel copyWith({
    String? id,
    String? name,
    String? description,
    BillCategory? category,
    int? value,
    DateTime? createdAt,
    BillStatus? billStatus,
    int? dueDayOfTheMonth,
    int? totalParcels,
    int? payedParcels,
  }) {
    return BillModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      billStatus: billStatus ?? billStatus,
      dueDayOfTheMonth: dueDayOfTheMonth ?? this.dueDayOfTheMonth,
      totalParcels: totalParcels ?? this.totalParcels,
      payedParcels: payedParcels ?? this.payedParcels,
    );
  }
}
