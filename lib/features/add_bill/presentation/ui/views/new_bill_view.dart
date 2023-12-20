import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/add_bill/presentation/ui/widgets/add_item_form.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';
import 'package:split_bill/features/all_bills/presentation/providers/all_bills_provider.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/list_groups_small.dart';

@RoutePage()
class NewBillView extends StatefulWidget {
  const NewBillView({super.key});

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
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.router.pop(),
          ),
          actions: [
            IconButton(
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
                  log(bill.toString());
                  context.read<AllBillsProvider>().addBill(bill).then((_) {
                    context.router.pop();
                  });
                }
              },
            )
          ],
          title: const Text('New Bill'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
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
              const SizedBox(height: 32),

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
              ]
            ],
          ),
        ));
  }
}
