import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewBillView extends StatelessWidget {
  const NewBillView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.router.pop(),
          ),
          title: const Text('New Bill'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // add Persons
            AddPersonForm()
          ],
        ));
  }
}

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({super.key});

  @override
  State<AddPersonForm> createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  var listUsers = <String>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // add Persons
        const Text('Add Persons'),
        const SizedBox(height: 16),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Person Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // add form value to list
                    setState(() {
                      listUsers.add(_controller.text);
                    });
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
        ...listUsers.map((e) => Text(e)),
      ],
    );
  }
}
