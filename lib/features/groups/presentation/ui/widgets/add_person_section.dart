import 'package:flutter/material.dart';

class AddPersonSection extends StatefulWidget {
  final List<String>? initialPersons;
  final Function(List<String> persons) onChange;
  const AddPersonSection(
      {super.key, required this.onChange, this.initialPersons});

  @override
  State<AddPersonSection> createState() => _AddPersonSectionState();
}

class _AddPersonSectionState extends State<AddPersonSection> {
  List<String> chips = [];

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chips = widget.initialPersons ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Add Persons *',
            suffixIcon: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  chips.add(textEditingController.text);
                  widget.onChange(chips);
                  textEditingController.clear();
                });
              },
            ),
          ),
          controller: textEditingController,
          onSubmitted: (String value) {
            setState(() {
              chips.add(value);
              widget.onChange(chips);
              textEditingController.clear();
            });
          },
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: chips.map((String chip) {
            return Chip(
              label: Text(chip),
              onDeleted: () {
                setState(() {
                  chips.remove(chip);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
