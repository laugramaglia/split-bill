import 'package:flutter/material.dart';
import 'package:split_bill/features/add_bill/presentation/ui/widgets/add_item_form.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/list_groups_small.dart';

class NewBillView extends StatefulWidget {
  final Function(Bill) onSubmit;
  const NewBillView({super.key, required this.onSubmit});

  @override
  State<NewBillView> createState() => _NewBillViewState();
}

class _NewBillViewState extends State<NewBillView> {
  final _formKey = GlobalKey<FormState>();
  List<String> _listUsersStrings = [];
  String _title = '';
  List<ItemsBill> _billItems = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _title = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Bill title',
            ),
          ),

          // read groups
          const SizedBox(height: 16),
          const Text('Groups *'),
          ListGroupsSmall(
            onChange: (users) {
              setState(() {
                _listUsersStrings = users ?? [];
              });
            },
          ),
          const Divider(),
          // Add items
          if (_listUsersStrings.isNotEmpty) ...[
            const Text('Add items *'),
            AddItemForm(
              listUsers: _listUsersStrings,
              onSubmit: (listItems) {
                setState(() {
                  _billItems = listItems;
                });
              },
            ),
          ],
          const SizedBox(height: 32),
          ElevatedButton.icon(
            label: const Text('Continue'),
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (_billItems.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please add items'),
                    ),
                  );
                  return;
                }
                final Bill bill = Bill(
                  title: _title,
                  listItems: _billItems,
                );
                widget.onSubmit(bill);
              }
            },
          )
        ],
      ),
    );
  }
}
