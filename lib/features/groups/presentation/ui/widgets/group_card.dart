import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/config/routes/routes_names.dart';
import 'package:split_bill/features/groups/data/models/group.dart';
import 'package:split_bill/features/groups/presentation/providers/group_provider.dart';

class GroupCard extends StatelessWidget {
  final Group data;
  const GroupCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              blurRadius: 1,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: () => context.router.navigateNamed(RoutesNav.main.navTo +
              RoutesNav.allGroups.navTo +
              RoutesNav.editGroup.navToWithParam(data.key.toString())),
          borderRadius: BorderRadius.circular(8),
          child: ListTile(
            leading: Text(data.persons.length.toString()),
            title: Text(data.name),
            subtitle: data.description == null ? null : Text(data.description!),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // alert dialog on confirm delete
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Group'),
                    content: const Text(
                        'Are you sure you want to delete this group?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<GroupProvider>().deleteGroup(data);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
