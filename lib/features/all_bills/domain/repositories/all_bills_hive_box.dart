import 'package:hive/hive.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/user_bill_model.dart';

typedef AllBills = List<Bill>;

class AllBillsHiveBox {
  // crerate singelton instance
  static final AllBillsHiveBox instance = AllBillsHiveBox._();
  AllBillsHiveBox._();

  late final Box<Bill> _box;

  static const String hiveBoxName = 'bills_box';
  Future<void> init() async {
    Hive.registerAdapter(BillAdapter());
    Hive.registerAdapter(ItemsBillAdapter());
    Hive.registerAdapter(UserBillAdapter());

    _box = await Hive.openBox<Bill>(hiveBoxName);
  }

  AllBills getAllBills() => List.from(_box.values);

  // create update method
  Future<void> updateBill(itemKey, Bill bill) async {
    await _box.put(itemKey, bill);
  }

  Bill? getBillById(key) => _box.get(key);

  Future<void> addToBox(Bill bill) async => await _box.add(bill);
}
