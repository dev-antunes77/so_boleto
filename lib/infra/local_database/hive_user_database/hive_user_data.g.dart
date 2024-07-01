// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserDataAdapter extends TypeAdapter<HiveUserData> {
  @override
  final int typeId = 1;

  @override
  HiveUserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUserData(
      id: fields[1] as String,
      name: fields[2] as String,
      lastName: fields[3] as String,
      email: fields[4] as String,
      password: fields[5] as String,
      hasSeenOnboarding: fields[6] as bool,
      hasLightTheme: fields[7] as bool,
      payedTag: fields[8] as String,
      baseColor: fields[9] as String,
      createdAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUserData obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.hasSeenOnboarding)
      ..writeByte(7)
      ..write(obj.hasLightTheme)
      ..writeByte(8)
      ..write(obj.payedTag)
      ..writeByte(9)
      ..write(obj.baseColor)
      ..writeByte(10)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
