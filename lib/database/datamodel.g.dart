// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllSongsAdapter extends TypeAdapter<AllSongs> {
  @override
  final int typeId = 0;

  @override
  AllSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllSongs(
      path: fields[1] as String,
      id: fields[2] as int?,
      title: fields[3] as String?,
      duration: fields[4] as int?,
      artist: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AllSongs obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.artist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
