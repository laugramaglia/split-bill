import 'package:flutter/material.dart';
import 'package:split_bill/features/all_bills/data/models/user_bill_model.dart';

class BillItemPersonsExpansionTile extends StatefulWidget {
  final List<UserBill> users;
  final Function(bool? status, int indexUser, UserBill? user) onTap;
  const BillItemPersonsExpansionTile(
      {super.key, required this.users, required this.onTap});

  @override
  State<BillItemPersonsExpansionTile> createState() =>
      _BillItemPersonsExpansionTileState();
}

class _BillItemPersonsExpansionTileState
    extends State<BillItemPersonsExpansionTile> {
  @override
  void initState() {
    super.initState();
    widget.users.sort((a, b) => a.payed == true ? -1 : 1);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('Payed')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Has to Pay')),
        // add datacell payed by
      ],
      rows: widget.users
          .map(
            (UserBill user) => DataRow(
              cells: <DataCell>[
                DataCell(
                  // shioww an icon on the user that payed
                  user.payed == true
                      ? Center(
                          child: Icon(Icons.check_circle,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        )
                      : const SizedBox(),
                ),
                DataCell(Text(user.name)),
                DataCell(
                  Center(
                    child: Checkbox(
                      value: user.hasToPay,
                      onChanged: (status) {
                        final indexUser = widget.users.indexOf(user);
                        widget.onTap.call(status, indexUser, user);
                      },
                    ),
                  ),
                ),
                // add datacell payed by
              ],
            ),
          )
          .toList(),
    );
  }
}

// create similar but on a data table

