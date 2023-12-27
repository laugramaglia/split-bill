import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/groups/data/models/group.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/add_person_section.dart';

import '../../providers/group_provider.dart';

class NewGroupForm extends StatefulWidget {
  final Group? group;
  final bool showDescription;
  final void Function() onSuccess;
  const NewGroupForm(
      {super.key,
      this.group,
      this.showDescription = true,
      required this.onSuccess});

  @override
  State<NewGroupForm> createState() => _NewGroupFormState();
}

class _NewGroupFormState extends State<NewGroupForm> {
  final _formKey = GlobalKey<FormState>();

  late Map<String, dynamic> _map;

  @override
  void initState() {
    super.initState();
    _map = widget.group?.toMap() ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Group Name
            TextFormField(
              initialValue: widget.group?.name,
              decoration: const InputDecoration(
                labelText: 'Group Name *',
              ),
              onChanged: (value) {
                _map[Group.jsonNameKey] = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Group Description
            if (widget.showDescription) ...[
              TextFormField(
                initialValue: widget.group?.description,
                onChanged: (value) {
                  _map[Group.jsonDescriptionKey] = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Group Description',
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Persons

            // Add Person Section
            AddPersonSection(
              initialPersons: widget.group?.persons,
              onChange: (List<String> persons) {
                _map[Group.jsonPersonsKey] = persons;
              },
            ),

            const SizedBox(height: 16),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                // check if _map['persons'] is null
                if (_map[Group.jsonPersonsKey] == null ||
                    _map[Group.jsonPersonsKey].isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please add at least one person'),
                    ),
                  );
                  return;
                }

                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Group group = Group.fromMap(_map);
                  context
                      .read<GroupProvider>()
                      .addGroup(group, widget.group?.key)
                      .then((_) => widget.onSuccess.call());
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
