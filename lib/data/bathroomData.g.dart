// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bathroomData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BathroomDataAdapter extends TypeAdapter<BathroomData> {
  @override
  final int typeId = 1;

  @override
  BathroomData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BathroomData()
      ..discomfortLevel = fields[0] as double
      ..numOfTimes = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, BathroomData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.discomfortLevel)
      ..writeByte(1)
      ..write(obj.numOfTimes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BathroomDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
