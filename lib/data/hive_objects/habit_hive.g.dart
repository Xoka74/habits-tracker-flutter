// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitHiveAdapter extends TypeAdapter<HabitHive> {
  @override
  final int typeId = 1;

  @override
  HabitHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitHive(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      priority: HabitPriority.values[fields[3]],
      type: HabitType.values[fields[4]],
      count: fields[5] as int,
      creationDate: fields[6] as DateTime,
      isSynced: fields[7] as bool,
      doneDates: (fields[8] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, HabitHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.priority.index)
      ..writeByte(4)
      ..write(obj.type.index)
      ..writeByte(5)
      ..write(obj.count)
      ..writeByte(6)
      ..write(obj.creationDate)
      ..writeByte(7)
      ..write(obj.isSynced)
      ..writeByte(8)
      ..write(obj.doneDates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
