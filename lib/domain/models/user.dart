// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  UserModel({
    this.userId = '',
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.hasSeenOnbording = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String getFormattedCreatedAt() {
    final DateFormat format = DateFormat('dd/MM/yyyy');
    return format.format(createdAt);
  }

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
