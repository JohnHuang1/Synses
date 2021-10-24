// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dietData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietDataAdapter extends TypeAdapter<DietData> {
  @override
  final int typeId = 4;

  @override
  DietData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DietData(
      proteinVal: fields[0] as double,
      fruitVal: fields[1] as double,
      grainVal: fields[2] as double,
      dairyVal: fields[3] as double,
      junkFoodVal: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DietData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.proteinVal)
      ..writeByte(1)
      ..write(obj.fruitVal)
      ..writeByte(2)
      ..write(obj.grainVal)
      ..writeByte(3)
      ..write(obj.dairyVal)
      ..writeByte(4)
      ..write(obj.junkFoodVal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
