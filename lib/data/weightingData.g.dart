// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weightingData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeightingDataAdapter extends TypeAdapter<WeightingData> {
  @override
  final int typeId = 5;

  @override
  WeightingData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeightingData()
      ..sleepRank = fields[0] as double
      ..bathroomRank = fields[1] as double
      ..moodRank = fields[2] as double
      ..exerciseRank = fields[3] as double
      ..dietRank = fields[4] as double
      ..hydrationRank = fields[5] as double;
  }

  @override
  void write(BinaryWriter writer, WeightingData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.sleepRank)
      ..writeByte(1)
      ..write(obj.bathroomRank)
      ..writeByte(2)
      ..write(obj.moodRank)
      ..writeByte(3)
      ..write(obj.exerciseRank)
      ..writeByte(4)
      ..write(obj.dietRank)
      ..writeByte(5)
      ..write(obj.hydrationRank);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightingDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
