import 'package:hive_flutter/hive_flutter.dart';

part 'user_bill_model.g.dart';

@HiveType(typeId: 3)
class UserBill extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool hasToPay;

  UserBill({
    required this.name,
    required this.hasToPay,
  });

  UserBill copyWith({
    String? name,
    bool? hasToPay,
  }) {
    return UserBill(
      name: name ?? this.name,
      hasToPay: hasToPay ?? this.hasToPay,
    );
  }

  @override
  String toString() => 'UserBill(name: $name, hasToPay: $hasToPay)';
}
