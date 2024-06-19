// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserModelAdapter extends TypeAdapter<HiveUserModel> {
  @override
  final int typeId = 1;

  @override
  HiveUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUserModel(
      userId: fields[1] as String,
      name: fields[2] as String,
      lastName: fields[3] as String,
      email: fields[4] as String,
      password: fields[6] as String,
      createdAt: fields[8] as DateTime?,
      hasSeenOnbording: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUserModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.hasSeenOnbording)
      ..writeByte(8)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
