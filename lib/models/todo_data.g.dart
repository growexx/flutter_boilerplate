// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoDataAdapter extends TypeAdapter<TodoData> {
  @override
  final int typeId = 1;

  @override
  TodoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoData(
      listId: fields[0] as String,
      title: fields[1] as String,
      data: fields[2] as String,
      dateTime: fields[3] as String,
      userId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TodoData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.listId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
