// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsBillAdapter extends TypeAdapter<ItemsBill> {
  @override
  final int typeId = 2;

  @override
  ItemsBill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsBill(
      name: fields[0] as String,
      amount: fields[1] as double,
      listPersons: (fields[2] as List).cast<UserBill>(),
    );
  }

  @override
  void write(BinaryWriter writer, ItemsBill obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.listPersons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsBillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
