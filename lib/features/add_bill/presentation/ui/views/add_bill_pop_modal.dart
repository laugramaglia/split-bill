import 'package:flutter/material.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/list_all_groups.dart';

class AddBillPopModal extends StatelessWidget {
  const AddBillPopModal({super.key});

  static void showModal(BuildContext context) => showModalBottomSheet<void>(
      context: context,
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
          padding: const EdgeInsets.all(16),
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
              _TitleSection(
                title: 'New Group',
                child: SizedBox(),
              ),
              _TitleSection(
                  title: 'All Groups', child: ListAllGroups(isSliver: false)),
            ],
          ),
        ),
      ),
    );
  }
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
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        const Divider(),
        child,
        const SizedBox(height: 8),
      ],
    );
  }
}
