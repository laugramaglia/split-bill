import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/new_group_form.dart';

@RoutePage()
class AddGroupView extends StatelessWidget {
  const AddGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(),
        ),
        title: const Text('New Group'),
      ),
      body: NewGroupForm(
        onSuccess: () => context.router.pop(),
      ),
    );
  }
}
