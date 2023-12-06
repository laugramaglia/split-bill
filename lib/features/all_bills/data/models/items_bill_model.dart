import 'package:hive_flutter/hive_flutter.dart';
import 'package:split_bill/features/all_bills/data/models/user_bill_model.dart';
part 'items_bill_model.g.dart';

@HiveType(typeId: 2)
class ItemsBill extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final List<UserBill> listPersons;

  ItemsBill({
    required this.name,
    required this.amount,
    required this.id,
    required this.listPersons,
  });

  List<UserBill> get totalPersonsPay =>
      List.from(listPersons.where((element) => element.hasToPay == true));

  double get amountPerPerson => amount / totalPersonsPay.length;

  String get amountDividedPersonString =>
      '\$$amount / ${totalPersonsPay.length} = \$$amountPerPerson';

  ItemsBill copyWith({
    String? name,
    double? amount,
    String? id,
    List<UserBill>? listPersons,
  }) {
    return ItemsBill(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      id: id ?? this.id,
      listPersons: listPersons ?? this.listPersons,
    );
  }
}
