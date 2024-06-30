// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:so_boleto/core/extensions/date_time_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_data.dart';

part 'user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData extends Equatable {
  UserData({
    this.id = '',
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.hasSeenOnboarding = false,
    this.hasLightTheme = true,
    this.payedTag = PayedTag.stample,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  Map<String, dynamic> toFirestore() => <String, dynamic>{
        'id': id,
        'name': name,
        'lastName': lastName,
        'email': email,
        'hasSeenOnboarding': hasSeenOnboarding,
        'hasLightTheme': hasLightTheme,
        'payedTag': payedTag.value,
        'createdAt': createdAt.dateTimeToStringData(),
      };

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data();
    return UserData(
      id: data?['id'],
      name: data?['name'],
      lastName: data?['lastName'],
      email: data?['email'],
      hasSeenOnboarding: data?['hasSeenOnboarding'],
      hasLightTheme: data?['hasLightTheme'],
      payedTag: (data?['payedTag'] as String).payedTagToEnum(),
      createdAt: (data?['createdAt'] as String).stringToDateTime(),
    );
  }

  factory UserData.fromHiveUser(HiveUserData hiveUser) => UserData(
        id: hiveUser.id,
        name: hiveUser.name,
        lastName: hiveUser.lastName,
        email: hiveUser.email,
        password: hiveUser.password,
        hasLightTheme: hiveUser.hasLightTheme,
        hasSeenOnboarding: hiveUser.hasSeenOnboarding,
        payedTag: hiveUser.payedTag.payedTagToEnum(),
        createdAt: hiveUser.createdAt,
      );

  String get userName => '${name.capitalize()} ${lastName.capitalize()}';

  final String id;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final bool hasSeenOnboarding;
  final bool hasLightTheme;
  final PayedTag payedTag;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        id,
        name,
        lastName,
        email,
        password,
        createdAt,
      ];

  UserData copyWith({
    String? id,
    String? name,
    String? lastName,
    String? email,
    String? password,
    bool? hasSeenOnboarding,
    bool? hasLightTheme,
    PayedTag? payedTag,
    DateTime? createdAt,
  }) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        hasSeenOnboarding: hasSeenOnboarding ?? this.hasSeenOnboarding,
        hasLightTheme: hasLightTheme ?? this.hasLightTheme,
        payedTag: payedTag ?? this.payedTag,
        createdAt: createdAt ?? this.createdAt,
      );
}
