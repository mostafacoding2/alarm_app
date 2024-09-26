// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAlarmAdapter extends TypeAdapter<ModelAlarm> {
  @override
  final int typeId = 0;

  @override
  ModelAlarm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelAlarm(
      content: fields[0] as String,
      period: fields[1] as String,
      time: fields[2] as String,
      history: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelAlarm obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.period)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAlarmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
