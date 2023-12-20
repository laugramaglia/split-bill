import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/domain/repositories/tranfers_extension.dart';
import 'package:split_bill/features/all_bills/presentation/providers/all_bills_provider.dart';
import 'package:split_bill/features/outcome/domain/repositories/export_repository.dart';

import 'package:split_bill/features/outcome/presentation/ui/widgets/expenses_user.dart';
import 'package:split_bill/features/outcome/presentation/ui/widgets/tranfers_resume.dart';

@RoutePage()
class ExportView extends StatefulWidget {
  final String id;
  const ExportView({super.key, @PathParam('id') required this.id});

  @override
  State<ExportView> createState() => _ExportViewState();
}

class _ExportViewState extends State<ExportView> {
  Bill? bill;

  Future<void> initBill() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bill = await context
          .read<AllBillsProvider>()
          .getBillById(int.parse(widget.id));
    });
  }

  @override
  void initState() {
    super.initState();
    initBill().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (bill case final bill?) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Export'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.router.pop();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                ExportRepository.exportString(bill);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      )),
                  ExpensesUser(bill.divideByUser()),

                  const SizedBox(height: 24),

                  TranfersResume(bill
                      .divideByUser()
                      .returnTranferList()) // show how much each user has payed and how much has to pay to others
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.popRoute();
        },
      )),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
