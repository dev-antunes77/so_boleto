// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      hasSeenOnboarding: json['hasSeenOnboarding'] as bool? ?? false,
      hasLightTheme: json['hasLightTheme'] as bool? ?? true,
      payedTag: $enumDecodeNullable(_$PayedTagEnumMap, json['payedTag']) ??
          PayedTag.stample,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'hasSeenOnboarding': instance.hasSeenOnboarding,
      'hasLightTheme': instance.hasLightTheme,
      'payedTag': _$PayedTagEnumMap[instance.payedTag]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$PayedTagEnumMap = {
  PayedTag.stample: 'stample',
  PayedTag.check: 'check',
  PayedTag.sideBar: 'bar',
};
