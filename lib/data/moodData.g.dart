// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moodData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodDataAdapter extends TypeAdapter<MoodData> {
  @override
  final int typeId = 2;

  @override
  MoodData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodData()..happinessLevel = fields[0] as double;
  }

  @override
  void write(BinaryWriter writer, MoodData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.happinessLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
