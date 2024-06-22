// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:so_boleto/core/extensions/date_time_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_model.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  UserModel({
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.hasSeenOnbording = false,
    String? id,
    DateTime? createdAt,
  })  : id = id ?? AppFormatters.randomIdFormater(),
        createdAt = createdAt ?? DateTime.now();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toFirestore() => <String, dynamic>{
        'id': id,
        'name': name,
        'lastName': lastName,
        'email': email,
        'createdAt': createdAt.dateTimeToStringData(),
      };

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data();
    return UserModel(
      id: data?['id'],
      name: data?['name'],
      lastName: data?['lastName'],
      email: data?['email'],
      createdAt: (data?['createdAt'] as String).stringToDateTime(),
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromHiveUser(HiveUserModel hiveUser) => UserModel(
        id: hiveUser.id,
        name: hiveUser.name,
        lastName: hiveUser.lastName,
        email: hiveUser.email,
        password: hiveUser.password,
        createdAt: hiveUser.createdAt,
        hasSeenOnbording: hiveUser.hasSeenOnbording,
      );

  final String id;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final DateTime createdAt;
  bool hasSeenOnbording;

  @override
  List<Object?> get props => [
        id,
        name,
        lastName,
        email,
        password,
        createdAt,
        hasSeenOnbording,
      ];

  UserModel copyWith({
    String? id,
    String? name,
    String? lastName,
    String? email,
    String? password,
    DateTime? createdAt,
    bool? hasSeenOnbording,
  }) =>
      UserModel(
        id: id ?? id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        hasSeenOnbording: hasSeenOnbording ?? this.hasSeenOnbording,
      );
}
