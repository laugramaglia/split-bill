import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/groups/presentation/providers/group_provider.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/group_card.dart';

class ListAllGroups extends StatelessWidget {
  final Function()? onTap;
  final String label;
  const ListAllGroups({super.key, this.onTap, this.label = 'Add Group'});

  @override
  Widget build(BuildContext context) {
    return _BuildList(
      onTap: onTap,
      label: label,
    );
  }
}

class _BuildList extends StatelessWidget {
  final Function()? onTap;
  final String label;
  const _BuildList({
    super.key,
    this.onTap,
    this.label = 'Add Group',
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GroupProvider>().state;
    return state.map(
        loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
        error: (err) => Center(
              child: Text(err.message),
            ),
        data: (data) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: data.isNotEmpty
                  ? List.from(data.map((e) => GroupCard(data: e)))
                  : [
                      const Center(
                        child: Text('No groups found'),
                      ),
                      if (onTap case final onTap?)
                        ElevatedButton(
                          onPressed: onTap,
                          child: Text(label),
                        )
                    ],
            ));
  }
}
