// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntryAdapter extends TypeAdapter<Entry> {
  @override
  final int typeId = 6;

  @override
  Entry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Entry()
      ..timestamp = fields[0] as DateTime
      ..sleepData = fields[1] as SleepData?
      ..bathroomData = fields[2] as BathroomData?
      ..moodData = fields[3] as MoodData?
      ..exerciseData = fields[4] as ExerciseData?
      ..weightingData = fields[5] as WeightingData?
      ..dietData = fields[6] as DietData?
      ..hydrationData = fields[7] as HydrationData?
      ..ibsData = fields[8] as IBSData?;
  }

  @override
  void write(BinaryWriter writer, Entry obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.sleepData)
      ..writeByte(2)
      ..write(obj.bathroomData)
      ..writeByte(3)
      ..write(obj.moodData)
      ..writeByte(4)
      ..write(obj.exerciseData)
      ..writeByte(5)
      ..write(obj.weightingData)
      ..writeByte(6)
      ..write(obj.dietData)
      ..writeByte(7)
      ..write(obj.hydrationData)
      ..writeByte(8)
      ..write(obj.ibsData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
