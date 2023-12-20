import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/groups/presentation/providers/group_provider.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/new_group_form.dart';

@RoutePage()
class EditGroupView extends StatelessWidget {
  final String groupId;
  const EditGroupView({super.key, @PathParam('id') required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(),
        ),
        title: const Text('Edit Group'),
      ),
      body: NewGroupForm(
        group: context.read<GroupProvider>().getByKey(int.parse(groupId)),
      ),
    );
  }
}
