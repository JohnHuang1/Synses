// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydrationData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HydrationDataAdapter extends TypeAdapter<HydrationData> {
  @override
  final int typeId = 7;

  @override
  HydrationData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HydrationData()..waterAmt = fields[0] as double;
  }

  @override
  void write(BinaryWriter writer, HydrationData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.waterAmt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HydrationDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
