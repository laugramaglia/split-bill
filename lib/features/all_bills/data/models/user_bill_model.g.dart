// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserBillAdapter extends TypeAdapter<UserBill> {
  @override
  final int typeId = 3;

  @override
  UserBill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserBill(
      name: fields[0] as String,
      hasToPay: fields[1] as bool,
      payed: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserBill obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.hasToPay)
      ..writeByte(2)
      ..write(obj.payed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
