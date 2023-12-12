import 'package:flutter/material.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/user_bill_model.dart';

class BillItemPersonsExpansionTile extends StatelessWidget {
  final List<UserBill> users;
  final Function(bool? status, int indexUser, UserBill? user) onTap;
  const BillItemPersonsExpansionTile(
      {super.key, required this.users, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.from(
      users.map(
        (UserBill user) => ListTile(
            title: Text('    ${user.name}'),
            trailing: Checkbox(
                value: user.hasToPay,
                onChanged: (status) {
                  final indexUser = users.indexOf(user);
                  onTap.call(status, indexUser, user);
                })),
      ),
    ));
  }
}
