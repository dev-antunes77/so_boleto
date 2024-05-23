// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillModel _$BillModelFromJson(Map<String, dynamic> json) => BillModel(
      dueDate: DateTime.parse(json['dueDate'] as String),
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      totalParcels: (json['totalParcels'] as num?)?.toInt() ?? 1,
      value: (json['value'] as num?)?.toInt() ?? 1,
      payedParcels: (json['payedParcels'] as num?)?.toInt() ?? 0,
      hiveIndex: (json['hiveIndex'] as num?)?.toInt() ?? 0,
      category: $enumDecodeNullable(_$CategoryEnumMap, json['category']),
      billState: $enumDecodeNullable(_$BillStateEnumMap, json['billState']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BillModelToJson(BillModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$CategoryEnumMap[instance.category]!,
      'value': instance.value,
      'createdAt': instance.createdAt.toIso8601String(),
      'dueDate': instance.dueDate.toIso8601String(),
      'billState': _$BillStateEnumMap[instance.billState]!,
      'totalParcels': instance.totalParcels,
      'payedParcels': instance.payedParcels,
      'hiveIndex': instance.hiveIndex,
    };

const _$CategoryEnumMap = {
  Category.rent: 'rent',
  Category.groceries: 'groceries',
  Category.transportation: 'transportation',
  Category.automobile: 'automobile',
  Category.insurance: 'insurance',
  Category.communication: 'communication',
  Category.entertainment: 'entertainment',
  Category.healthCare: 'healthCare',
  Category.creditCard: 'creditCard',
  Category.travel: 'travel',
  Category.debt: 'debt',
  Category.investiment: 'investiment',
  Category.miscellaneous: 'miscellaneous',
};

const _$BillStateEnumMap = {
  BillState.open: 'open',
  BillState.payed: 'payed',
  BillState.delayed: 'delayed',
};
