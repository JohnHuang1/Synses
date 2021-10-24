// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IBSData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IBSDataAdapter extends TypeAdapter<IBSData> {
  @override
  final int typeId = 8;

  @override
  IBSData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IBSData()..severity = fields[0] as double;
  }

  @override
  void write(BinaryWriter writer, IBSData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.severity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IBSDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
