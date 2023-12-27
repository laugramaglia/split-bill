import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/domain/repositories/tranfers_extension.dart';
import 'package:split_bill/features/outcome/domain/repositories/export_repository.dart';

import 'package:split_bill/features/outcome/presentation/ui/widgets/expenses_user.dart';
import 'package:split_bill/features/outcome/presentation/ui/widgets/tranfers_resume.dart';

@RoutePage()
class ExportView extends StatelessWidget {
  final Bill bill;
  const ExportView({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ExportMainComponent(bill: bill)),
      ),
    );
  }
}

class ExportMainComponent extends StatelessWidget {
  final Bill? bill;
  final Function()? onPress;
  const ExportMainComponent({super.key, required this.bill, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (bill case final bill?) ...[
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    bill.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(bill.totalAmountString,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ],
            ),
          ),
          ExpensesUser(bill.divideByUser()),

          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transfers',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ElevatedButton.icon(
                label: const Text('Export'),
                icon: const Icon(Icons.share),
                onPressed: () {
                  onPress?.call();
                  ExportRepository.exportString(bill);
                },
              ),
            ],
          ),
          TranfersResume(bill
              .divideByUser()
              .returnTranferList()) // show how much each user has payed and how much has to pay to others
        ] else ...[
          const Text('Bill not found'),
          const Divider(),
          const Text('Please try again'),
          const Divider(),
          const Text('Check the bill has some content'),
        ],
      ],
    );
  }
}
