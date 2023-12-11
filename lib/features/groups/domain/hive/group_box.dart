import 'package:hive/hive.dart';
import 'package:split_bill/features/groups/data/models/group.dart';

class GroupBox {
  // crerate singelton instance
  static final GroupBox instance = GroupBox._();
  GroupBox._();

  late final Box<Group> _box;

  static const String hiveBoxName = 'group_box';
  Future<void> init() async {
    Hive.registerAdapter(GroupAdapter());

    _box = await Hive.openBox<Group>(hiveBoxName);
  }

  // check if box has value
  bool boxContains(key) => _box.containsKey(key);

  // get value from key
  Group? getSingleGroup(itemKey) => _box.get(itemKey);

  List<Group> getAll() => List.from(_box.values);

  Future<void> addToBox(Group bill, [key]) async =>
      key != null ? await _box.put(key, bill) : await _box.add(bill);
}
