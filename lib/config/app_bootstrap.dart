import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/all_bills/domain/repositories/all_bills_repository.dart';
import 'package:split_bill/features/all_bills/presentation/providers/all_bills_provider.dart';

class AppBootstrap extends StatelessWidget {
  final Widget child;
  const AppBootstrap({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AllBillsProvider>(
          create: (context) =>
              AllBillsProvider(context, billRepository: AllBillRepository()),
        ),
      ],
      child: child,
    );
  }
}
