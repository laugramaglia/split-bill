import 'package:hive_flutter/hive_flutter.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';
import 'package:split_bill/features/all_bills/domain/repositories/tranfers_extension.dart';

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

  toMap() => {
        'title': title,
        'total': _totalAmount,
        'listItems': listItems.map((x) => x.toMap()).toList(),
      };

  String get totalAmountString => '\$$_totalAmount';

  @override
  String toString() => 'Bill(title: $title, listItems: $listItems)';
}

extension BillX on Bill {
  MapDivideByUser divideByUser() {
    final list = <Map<String, dynamic>>[];

    for (ItemsBill item in listItems) {
      for (final user in item.listPersons) {
        final Map<String, dynamic> map = {
          'userName': user.name,
          'spend': user.payed ? item.amount : 0.0,
          'cost': item.amountPerPerson,
        };

        list.add(map);
      }
    }
    Map<String, Map<String, double>> combined = {};

    for (var item in list) {
      String userName = item['userName'];
      double? spend = item['spend'], cost = item['cost'];

      if (combined.containsKey(userName)) {
        combined[userName]!['spend'] =
            (combined[userName]!['spend']!) + (spend ?? 0.0);
        combined[userName]!['cost'] =
            (combined[userName]!['cost']!) + (cost ?? 0.0);
      } else {
        combined[userName] = {
          'spend': spend ?? 0.0,
          'cost': cost ?? 0.0,
        };
      }
    }

    // final list to list and return
    return combined;
  }
}
