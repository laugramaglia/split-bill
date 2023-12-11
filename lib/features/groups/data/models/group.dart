import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 4)
class Group extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final List<String> persons;

  Group({
    required this.name,
    required this.description,
    required this.persons,
  });

  Group copyWith({
    String? name,
    String? description,
    List<String>? persons,
  }) {
    return Group(
      name: name ?? this.name,
      description: description ?? this.description,
      persons: persons ?? this.persons,
    );
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      name: map['name'],
      description: map['description'],
      persons: List<String>.from(map['persons']),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'persons': persons,
    };
  }

  @override
  String toString() =>
      'Group(name: $name, description: $description, persons: $persons)';

  static const String jsonNameKey = 'name',
      jsonDescriptionKey = 'description',
      jsonPersonsKey = 'persons';
}
