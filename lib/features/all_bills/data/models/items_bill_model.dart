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
  final List<UserBill> listPersons;

  ItemsBill({
    required this.name,
    required this.amount,
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
    List<UserBill>? listPersons,
  }) {
    return ItemsBill(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      listPersons: listPersons ?? this.listPersons,
    );
  }

  factory ItemsBill.fromJson(Map<String, dynamic> json) => ItemsBill(
        name: json[jsonNameKey],
        amount: json[jsonAmountKey],
        listPersons: List<UserBill>.from(
            json[jsonListPersonsKey].map((x) => UserBill.fromJson(x))),
      );

  @override
  String toString() =>
      'ItemsBill(name: $name, amount: $amount, listPersons: $listPersons)';

  static String jsonNameKey = 'name',
      jsonAmountKey = 'amount',
      jsonListPersonsKey = 'listPersons';
}
