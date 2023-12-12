import 'package:flutter/material.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/user_bill_model.dart';
import 'package:split_bill/features/all_bills/presentation/ui/widgets/bill_item_persons_expansion_tile.dart';

class AddItemForm extends StatefulWidget {
  final List<String> listUsers;
  final Function(List<ItemsBill> listItems) onSubmit;
  const AddItemForm(
      {super.key, required this.listUsers, required this.onSubmit});

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _formKey = GlobalKey<FormState>();

  List<ItemsBill> _listUsers = [];
  Map<String, dynamic> _mapUsers = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _mapUsers[ItemsBill.jsonNameKey] = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Item',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                  width: 80,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _mapUsers[ItemsBill.jsonAmountKey] =
                            double.tryParse(value)?.ceilToDouble();
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: '\$\$\$*',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      if (double.tryParse(value) == null) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // add usr bill
                      setState(() {
                        _listUsers.add(
                          ItemsBill(
                            name: _mapUsers[ItemsBill.jsonNameKey],
                            amount: _mapUsers[ItemsBill.jsonAmountKey],
                            listPersons: List.from(
                              widget.listUsers.map(
                                (e) => UserBill(
                                  name: e,
                                  hasToPay: true,
                                ),
                              ),
                            ),
                          ),
                        );
                        _formKey.currentState!.reset();
                        // dismiss keyboard
                        FocusScope.of(context).unfocus();
                        widget.onSubmit.call(_listUsers);
                      });
                    }
                  },
                  child: const Icon(Icons.add)),
            ],
          ),
        ),

        // show list items as Expandable list tile

        ListView.builder(
          shrinkWrap: true,
          itemCount: _listUsers.length,
          reverse: true,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(_listUsers[index].name),
              subtitle: Text(_listUsers[index].amountDividedPersonString),
              children: [
                BillItemPersonsExpansionTile(
                  users: _listUsers[index].listPersons,
                  onTap: (value, indexUser, _) {
                    setState(() {
                      _listUsers[index].listPersons[indexUser].hasToPay =
                          value!;
                      widget.onSubmit.call(_listUsers);
                    });
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
