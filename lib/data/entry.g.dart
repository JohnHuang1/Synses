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
    return Entry(
      timestamp: fields[0] as DateTime,
      timeSlept: fields[1] as double?,
      bathroomDiscomfortLevel: fields[2] as double?,
      happinessLevel: fields[3] as double?,
      exerciseDurationHours: fields[4] as double?,
      weightingData: fields[5] as WeightingData?,
      dietData: fields[6] as DietData?,
      waterAmt: fields[7] as double?,
      ibsIntensity: fields[8] as double?,
      exerciseIntensity: fields[9] as double?,
      numOfBathroomVisits: fields[10] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Entry obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.timeSlept)
      ..writeByte(2)
      ..write(obj.bathroomDiscomfortLevel)
      ..writeByte(3)
      ..write(obj.happinessLevel)
      ..writeByte(4)
      ..write(obj.exerciseDurationHours)
      ..writeByte(5)
      ..write(obj.weightingData)
      ..writeByte(6)
      ..write(obj.dietData)
      ..writeByte(7)
      ..write(obj.waterAmt)
      ..writeByte(8)
      ..write(obj.ibsIntensity)
      ..writeByte(9)
      ..write(obj.exerciseIntensity)
      ..writeByte(10)
      ..write(obj.numOfBathroomVisits);
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
