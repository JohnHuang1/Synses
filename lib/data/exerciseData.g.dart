// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exerciseData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseDataAdapter extends TypeAdapter<ExerciseData> {
  @override
  final int typeId = 3;

  @override
  ExerciseData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseData()
      ..hoursExercised = fields[0] as double
      ..intensity = fields[1] as double;
  }

  @override
  void write(BinaryWriter writer, ExerciseData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hoursExercised)
      ..writeByte(1)
      ..write(obj.intensity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
