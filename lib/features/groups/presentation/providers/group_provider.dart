import 'package:split_bill/common/async_state.dart';
import 'package:split_bill/common/async_state_notifier.dart';
import 'package:split_bill/features/groups/data/models/group.dart';
import 'package:split_bill/features/groups/domain/hive/group_box.dart';

class GroupProvider extends AsyncStateNotifier<List<Group>> {
  GroupProvider(super.context);

  @override
  Future<AsyncState<List<Group>>> build() async {
    await GroupBox.instance.init();
    return DataState(GroupBox.instance.getAll());
  }

  Future<void> addGroup(Group group, [key]) async {
    setState = LoadingState();

    await GroupBox.instance.addToBox(group, key);

    setState = DataState(GroupBox.instance.getAll());
  }

  Future<void> deleteGroup(Group group) async {
    setState = LoadingState();
    await group.delete();
    setState = DataState(GroupBox.instance.getAll());
  }

  Group getByKey(int key) => GroupBox.instance.getSingleGroup(key)!;
}
