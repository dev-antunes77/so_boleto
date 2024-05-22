// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      hasSeenOnbording: json['hasSeenOnbording'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'createdAt': instance.createdAt.toIso8601String(),
      'hasSeenOnbording': instance.hasSeenOnbording,
    };
