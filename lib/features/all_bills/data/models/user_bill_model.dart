import 'package:hive_flutter/hive_flutter.dart';

part 'user_bill_model.g.dart';

@HiveType(typeId: 3)
class UserBill extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool hasToPay;
  @HiveField(2)
  bool payed;

  UserBill({
    required this.name,
    required this.hasToPay,
    this.payed = false,
  });

  UserBill copyWith({
    String? name,
    bool? hasToPay,
    bool? payed,
  }) {
    return UserBill(
      name: name ?? this.name,
      hasToPay: hasToPay ?? this.hasToPay,
      payed: payed ?? this.payed,
    );
  }

  factory UserBill.fromJson(Map<String, dynamic> json) => UserBill(
        name: json[jsonNameKey],
        hasToPay: json[jsonHasToPayKey],
        payed: json[payedKey],
      );

  Map<String, dynamic> toMap() => {
        jsonNameKey: name,
        jsonHasToPayKey: hasToPay,
        payedKey: payed,
      };

  static const String jsonNameKey = 'name',
      jsonHasToPayKey = 'hasToPay',
      payedKey = 'payed';

  @override
  String toString() =>
      'UserBill(name: $name, hasToPay: $hasToPay, payed: $payed)';
}
