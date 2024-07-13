import 'package:cloud_firestore/cloud_firestore.dart';
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
    this.dueDay = 0,
    this.userId = '',
    String? id,
    BillCategory? category,
    BillStatus? billStatus,
    DateTime? createdAt,
  })  : id = id ?? AppFormatters.randomIdFormater(),
        createdAt = createdAt ?? DateTime(DateTime.now().year, DateTime.april),
        category = category ?? BillCategory.miscellaneous,
        billStatus = billStatus ?? BillStatus.open;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillModelToJson(this);

  Map<String, dynamic> toFirestore() => <String, dynamic>{
        'id': id,
        'userId': userId,
        'name': name,
        'description': description,
        'category': category.value,
        'billStatus': billStatus.value,
        'value': value,
        'totalParcels': totalParcels,
        'payedParcels': payedParcels,
        'dueDay': dueDay,
        'createdAt': createdAt.dateTimeToStringData(),
      };

  factory BillModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data();
    return BillModel(
      id: data?['id'],
      name: data?['name'],
      description: data?['description'],
      billStatus: (data?['billStatus'] as String).billStatuToEnum(),
      category: (data?['category'] as String).categoryToEnum(),
      value: data?['value'],
      payedParcels: data?['payedParcels'],
      totalParcels: data?['totalParcels'],
      dueDay: data?['dueDay'],
      userId: data?['userId'],
      createdAt: (data?['createdAt'] as String).stringToDateTime(),
    );
  }

  factory BillModel.fromHiveBillModel(HiveBillModel bill) => BillModel(
        id: bill.id,
        name: bill.name,
        description: bill.description,
        category: bill.category.categoryToEnum(),
        billStatus: bill.billStatus.billStatuToEnum(),
        totalParcels: bill.totalParcels,
        payedParcels: bill.payedParcels,
        value: bill.value,
        dueDay: bill.dueDay,
        createdAt: bill.createdAt,
      );

  factory BillModel.fromPromptToBill(String userId, PromptBill promptBill) =>
      BillModel(
        id: promptBill.id,
        userId: userId,
        name: promptBill.name,
        description: '',
        category: promptBill.category,
        billStatus: BillStatus.open,
        totalParcels: 0,
        payedParcels: 0,
        value: promptBill.value,
        dueDay: promptBill.dueDay,
        createdAt: DateTime.now(),
      );

  final String id;
  final String userId;
  final String name;
  final String description;
  final BillCategory category;
  final int value;
  final DateTime createdAt;
  final int dueDay;
  final BillStatus billStatus;
  final int totalParcels;
  final int payedParcels;

  int get parcelsLeft => totalParcels - payedParcels;

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        description,
        category,
        value,
        createdAt,
        dueDay,
        billStatus,
        totalParcels,
        payedParcels,
      ];

  BillModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? description,
    BillCategory? category,
    int? value,
    DateTime? createdAt,
    BillStatus? billStatus,
    int? dueDay,
    int? totalParcels,
    int? payedParcels,
  }) {
    return BillModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      billStatus: billStatus ?? this.billStatus,
      dueDay: dueDay ?? this.dueDay,
      totalParcels: totalParcels ?? this.totalParcels,
      payedParcels: payedParcels ?? this.payedParcels,
    );
  }
}
