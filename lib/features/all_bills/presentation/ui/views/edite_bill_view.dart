import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/presentation/providers/all_bills_provider.dart';

@RoutePage()
class EditeBillView extends StatefulWidget {
  final Bill item;
  const EditeBillView({required this.item, super.key});

  @override
  State<EditeBillView> createState() => _EditeBillViewState();
}

class _EditeBillViewState extends State<EditeBillView> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.item.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edite Bill'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: TextButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                Navigator.of(context).popUntil((route) => route.isFirst);
                final finalItem = widget.item.copyWith(
                  title: _titleController.text,
                );
                context
                    .read<AllBillsProvider>()
                    .updateBill(widget.item.key, finalItem);
              }
            },
            child: const Text('Save'),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
