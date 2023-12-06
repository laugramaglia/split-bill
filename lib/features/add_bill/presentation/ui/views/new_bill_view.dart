import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewBillView extends StatelessWidget {
  const NewBillView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Bill'),
      ),
      body: Center(
        child: Text('New Bill'),
      ),
    );
  }
}
