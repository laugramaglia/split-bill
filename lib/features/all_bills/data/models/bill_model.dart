import 'package:hive_flutter/hive_flutter.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';

part 'bill_model.g.dart';

@HiveType(typeId: 1)
class Bill extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<ItemsBill> listItems;

  late double _totalAmount;
  Bill({
    required this.title,
    required this.listItems,
  }) {
    _totalAmount = 0;
    for (ItemsBill item in listItems) {
      _totalAmount += item.amount;
    }
  }

  Bill copyWith({
    String? title,
    List<ItemsBill>? listItems,
  }) {
    return Bill(
      title: title ?? this.title,
      listItems: listItems ?? this.listItems,
    );
  }

  String get totalAmountString => '\$$_totalAmount';

  @override
  String toString() => 'Bill(title: $title, listItems: $listItems)';
}
