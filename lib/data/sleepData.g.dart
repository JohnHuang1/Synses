// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleepData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepDataAdapter extends TypeAdapter<SleepData> {
  @override
  final int typeId = 0;

  @override
  SleepData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SleepData()..hoursSlept = fields[0] as double;
  }

  @override
  void write(BinaryWriter writer, SleepData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.hoursSlept);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
