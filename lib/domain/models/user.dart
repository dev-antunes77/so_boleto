// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
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
    String? userId,
    DateTime? createdAt,
  })  : userId = userId ?? _generateRandomNumericId(),
        createdAt = createdAt ?? DateTime.now();

  static String _generateRandomNumericId() =>
      '${DateTime.now().millisecondsSinceEpoch.toString()}${(Random().nextInt(90000) + 10000)}';

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String getFormattedCreatedAt() {
    final DateFormat format = DateFormat('dd/MM/yyyy');
    return format.format(createdAt);
  }

  factory UserModel.fromHiveUser(HiveUserModel hiveUser) => UserModel(
        userId: hiveUser.userId,
        name: hiveUser.name,
        lastName: hiveUser.lastName,
        email: hiveUser.email,
        password: hiveUser.password,
        createdAt: hiveUser.createdAt,
        hasSeenOnbording: hiveUser.hasSeenOnbording,
      );

  final String userId;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final DateTime createdAt;
  bool hasSeenOnbording;

  @override
  List<Object?> get props => [
        userId,
        name,
        lastName,
        email,
        password,
        createdAt,
        hasSeenOnbording,
      ];

  UserModel copyWith({
    String? userId,
    String? name,
    String? lastName,
    String? email,
    String? password,
    DateTime? createdAt,
    bool? hasSeenOnbording,
  }) =>
      UserModel(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        hasSeenOnbording: hasSeenOnbording ?? this.hasSeenOnbording,
      );
}
