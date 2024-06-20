// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillModel _$BillModelFromJson(Map<String, dynamic> json) => BillModel(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      totalParcels: (json['totalParcels'] as num?)?.toInt() ?? 0,
      value: (json['value'] as num?)?.toInt() ?? 0,
      payedParcels: (json['payedParcels'] as num?)?.toInt() ?? 0,
      dueDayOfTheMonth: (json['dueDayOfTheMonth'] as num?)?.toInt() ?? 0,
      id: json['id'] as String?,
      category: $enumDecodeNullable(_$BillCategoryEnumMap, json['category']),
      billStatus: $enumDecodeNullable(_$BillStatusEnumMap, json['billStatus']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BillModelToJson(BillModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$BillCategoryEnumMap[instance.category]!,
      'value': instance.value,
      'createdAt': instance.createdAt.toIso8601String(),
      'dueDayOfTheMonth': instance.dueDayOfTheMonth,
      'billStatus': _$BillStatusEnumMap[instance.billStatus]!,
      'totalParcels': instance.totalParcels,
      'payedParcels': instance.payedParcels,
    };

const _$BillCategoryEnumMap = {
  BillCategory.automobile: 'automobile',
  BillCategory.creditCard: 'creditCard',
  BillCategory.debt: 'debt',
  BillCategory.devices: 'devices',
  BillCategory.education: 'education',
  BillCategory.electricity: 'electricity',
  BillCategory.entertainment: 'entertainment',
  BillCategory.groceries: 'groceries',
  BillCategory.gas: 'gas',
  BillCategory.healthCare: 'healthCare',
  BillCategory.insurance: 'insurance',
  BillCategory.investment: 'investment',
  BillCategory.internet: 'internet',
  BillCategory.miscellaneous: 'miscellaneous',
  BillCategory.rent: 'rent',
  BillCategory.petShop: 'petShop',
  BillCategory.telephone: 'telephone',
  BillCategory.transportation: 'transportation',
  BillCategory.travel: 'travel',
  BillCategory.water: 'water',
};

const _$BillStatusEnumMap = {
  BillStatus.open: 'open',
  BillStatus.payed: 'payed',
  BillStatus.delayed: 'delayed',
};
