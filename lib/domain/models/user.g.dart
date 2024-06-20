// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      bills: (json['bills'] as List<dynamic>?)
              ?.map((e) => BillModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasSeenOnbording: json['hasSeenOnbording'] as bool? ?? false,
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'createdAt': instance.createdAt.toIso8601String(),
      'bills': instance.bills.map((e) => e.toJson()).toList(),
      'hasSeenOnbording': instance.hasSeenOnbording,
    };
