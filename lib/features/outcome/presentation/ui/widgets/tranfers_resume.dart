import 'package:flutter/material.dart';

class TranfersResume extends StatelessWidget {
  final List<Map<String, dynamic>> tranfers;
  const TranfersResume(this.tranfers, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Transfers',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      for (final e in tranfers)
        ListTile(
          title: Row(
            children: [
              Text(
                e['from'],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.arrow_right_alt),
              const SizedBox(width: 16),
              Text(
                e['to'],
              ),
            ],
          ),
          subtitle: Text(
            '\$${e['amount']!.ceilToDouble()}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
    ]);
  }
}
