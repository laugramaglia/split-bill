import 'package:flutter/material.dart';

class ExpensesUser extends StatelessWidget {
  final Map<String, Map<String, double>> items;
  const ExpensesUser(this.items, {super.key});

  // {
  //    'userName': person.name,
  //    'totalSpend': totalSpend,
  //    'totalCost': totalCost,
  //    'totalDifference': totalDifference,
  // }

  @override
  Widget build(BuildContext context) {
    // usin items.divideByUser()
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          columns: const [
            DataColumn(label: Text('User')),
            DataColumn(label: Text('Total Payed')),
            DataColumn(label: Text('Total Spend')),
          ],
          rows: items.entries
              .map((e) => DataRow(cells: [
                    DataCell(
                      Text(
                        e.key,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ).colored(context, e.value),
                      ),
                    ),
                    DataCell(Text('\$${e.value['spend']!.ceilToDouble()}',
                        style: const TextStyle().colored(context, e.value))),
                    DataCell(Text('\$${e.value['cost']!.ceilToDouble()}',
                        style: const TextStyle().colored(context, e.value))),
                  ]))
              .toList()),
    );
  }
}

extension _Ex on TextStyle {
  TextStyle colored(BuildContext context, Map map) => copyWith(
        color: map['spend'] < map['cost']
            ? Theme.of(context).colorScheme.error
            : null,
      );
}
