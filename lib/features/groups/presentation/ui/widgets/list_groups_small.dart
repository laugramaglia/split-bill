import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/groups/data/models/group.dart';
import 'package:split_bill/features/groups/presentation/providers/group_provider.dart';

class ListGroupsSmall extends StatefulWidget {
  final void Function(List<String>? persons) onChange;
  const ListGroupsSmall({super.key, required this.onChange});

  @override
  State<ListGroupsSmall> createState() => _ListGroupsSmallState();
}

class _ListGroupsSmallState extends State<ListGroupsSmall> {
  Group? selectedGroup;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<GroupProvider>().state;
    return state.map(
      loading: () => const Center(
        child: CupertinoActivityIndicator(),
      ),
      error: (error) => const Center(
        child: Text('Error'),
      ),
      data: (data) => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ...data
              .map((e) => ChoiceChip(
                    showCheckmark: false,
                    label: Text(e.name),
                    avatar: CircleAvatar(
                      child: Text(
                        e.persons.length.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    selected: selectedGroup == e,
                    onSelected: (value) {
                      setState(() {
                        if (value) {
                          selectedGroup = e;
                        } else {
                          selectedGroup = null;
                        }
                        widget.onChange.call(selectedGroup?.persons);
                      });
                    },
                  ))
              .toList()
        ],
      ),
    );
  }
}
