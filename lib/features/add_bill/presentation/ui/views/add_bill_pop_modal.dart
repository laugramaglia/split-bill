import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/add_bill/presentation/ui/views/new_bill_view.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/presentation/providers/all_bills_provider.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/list_all_groups.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/new_group_form.dart';
import 'package:split_bill/features/outcome/presentation/ui/views/export_view.dart';

class AddBillPopModal extends StatelessWidget {
  const AddBillPopModal({super.key});

  static void showModal(BuildContext context) => showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      builder: (BuildContext context) => const AddBillPopModal());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  ),
                ),
              ),
              const Divider(color: Colors.transparent),
              const _StepSection()
            ],
          ),
        ),
      ),
    );
  }
}

class _StepSection extends StatefulWidget {
  const _StepSection({super.key});

  @override
  State<_StepSection> createState() => __StepSectionState();
}

class __StepSectionState extends State<_StepSection> {
  int _index = 0;
  Bill? _bill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            stepIconBuilder: (stepIndex, stepState) => Material(
                color: _index >= stepIndex
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.surfaceVariant,
                shape: const CircleBorder(),
                child: Center(child: Text((stepIndex + 1).toString()))),
            controlsBuilder: (context, details) => const SizedBox(),
            currentStep: _index,
            onStepCancel: () {
              if (_index > 0) {
                setState(() {
                  _index -= 1;
                });
              }
            },
            onStepContinue: () {
              if (_index <= 0) {
                setState(() {
                  _index += 1;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: [
          Step(
              title: _index == 0 ? const Text('Bill') : const SizedBox(),
              content: NewBillView(
                onSubmit: (bill) {
                  setState(() {
                    _bill = bill;
                    _index += 1;
                  });
                },
              )),
          Step(
            title: _index == 1 ? const Text('Export') : const SizedBox(),
            content: ExportMainComponent(
              bill: _bill,
              onPress: () {
                if (_bill != null) {
                  context.read<AllBillsProvider>().addBill(_bill!);
                }
              },
            ),
          ),
        ]));
  }
}

class _Step {
  final String title;
  final Widget content;

  const _Step({required this.title, required this.content});
}

class _TitleSection extends StatelessWidget {
  final String? title;
  final Widget child;

  const _TitleSection({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title case final title?)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        const Divider(),
        child,
        const SizedBox(height: 8),
      ],
    );
  }
}
