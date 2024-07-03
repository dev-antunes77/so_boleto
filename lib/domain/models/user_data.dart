import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:so_boleto/core/extensions/color_extensions.dart';
import 'package:so_boleto/core/extensions/date_time_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_data.dart';

class UserData extends Equatable {
  UserData({
    this.id = '',
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.profilePicturePath = '',
    this.hasSeenOnboarding = false,
    this.hasLightTheme = true,
    this.favoredDueDay = 0,
    this.payedTag = PayedTag.stample,
    this.baseColor = const Color.fromARGB(255, 4, 135, 58),
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'lastName': lastName,
        'email': email,
        'hasSeenOnboarding': hasSeenOnboarding,
        'hasLightTheme': hasLightTheme,
        'payedTag': payedTag.value,
        'favoredDueDay': favoredDueDay,
        'profilePicturePath': profilePicturePath,
        'baseColor': baseColor.colorToJson(),
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
      favoredDueDay: data?['favoredDueDay'],
      profilePicturePath: data?['profilePicturePath'],
      payedTag: (data?['payedTag'] as String).payedTagToEnum(),
      baseColor: (data?['baseColor'] as String).colorFromJson(),
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
        baseColor: hiveUser.baseColor.colorFromJson(),
        favoredDueDay: hiveUser.favoredDueDay,
        profilePicturePath: hiveUser.profilePicturePath,
        createdAt: hiveUser.createdAt,
      );

  String get userName => '${name.capitalize()} ${lastName.capitalize()}';

  final String id;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String profilePicturePath;
  final bool hasSeenOnboarding;
  final bool hasLightTheme;
  final PayedTag payedTag;
  final int favoredDueDay;
  final Color baseColor;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        id,
        name,
        lastName,
        email,
        password,
        createdAt,
        hasSeenOnboarding,
        hasLightTheme,
        payedTag,
        baseColor,
        profilePicturePath,
        favoredDueDay,
        createdAt,
      ];

  UserData copyWith({
    String? id,
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? profilePicturePath,
    bool? hasSeenOnboarding,
    bool? hasLightTheme,
    PayedTag? payedTag,
    Color? baseColor,
    int? favoredDueDay,
    DateTime? createdAt,
  }) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        profilePicturePath: profilePicturePath ?? this.profilePicturePath,
        hasSeenOnboarding: hasSeenOnboarding ?? this.hasSeenOnboarding,
        hasLightTheme: hasLightTheme ?? this.hasLightTheme,
        payedTag: payedTag ?? this.payedTag,
        baseColor: baseColor ?? this.baseColor,
        favoredDueDay: favoredDueDay ?? this.favoredDueDay,
        createdAt: createdAt ?? this.createdAt,
      );
}
