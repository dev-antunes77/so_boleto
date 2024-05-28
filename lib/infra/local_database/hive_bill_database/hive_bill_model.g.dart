// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBillModelAdapter extends TypeAdapter<HiveBillModel> {
  @override
  final int typeId = 0;

  @override
  HiveBillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBillModel(
      id: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      category: fields[4] as String,
      totalParcels: fields[6] as int,
      payedParcels: fields[7] as int,
      value: fields[8] as int,
      dueDayOfTheMonth: fields[9] as int,
      createdAt: fields[10] as DateTime,
      hiveIndex: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBillModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.totalParcels)
      ..writeByte(7)
      ..write(obj.payedParcels)
      ..writeByte(8)
      ..write(obj.value)
      ..writeByte(9)
      ..write(obj.dueDayOfTheMonth)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.hiveIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}