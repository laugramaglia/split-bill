import 'package:split_bill/common/async_state.dart';
import 'package:split_bill/common/async_state_notifier.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/domain/repositories/all_bills_hive_box.dart';
import 'package:split_bill/features/all_bills/domain/repositories/all_bills_repository.dart';

class AllBillsProvider extends AsyncStateNotifier<AllBills> {
  final AllBillRepository billRepository;
  AllBillsProvider(super.context, {required this.billRepository});

  @override
  Future<AsyncState<AllBills>> build() async {
    await AllBillsHiveBox.instance.init();
    final (response, error) = await billRepository.getAllBills();
    if (error != null) return ErrorState(error);
    return DataState(response);
  }

  // *****************************************
  // * List of bills
  // *****************************************
  void addBill(Bill bill) async {
    setState = LoadingState();

    final (bills, error) = await billRepository.addBill(bill);
    if (error != null) {
      setState = ErrorState(error);
      return;
    }
    setState = DataState(bills);
  }

  Future<void> updateBill(key, Bill bill) async {
    setState = LoadingState();

    final (bills, error) = await billRepository.updateBill(key, bill);
    if (error != null) {
      setState = ErrorState(error);
      return;
    }
    setState = DataState(bills);
  }

  Future<void> deleteBill(Bill bill) async {
    setState = LoadingState();

    final (bills, error) = await billRepository.deleteBill(bill);
    if (error != null) {
      setState = ErrorState(error);
      return;
    }
    setState = DataState(bills);
  }
  // *****************************************

  // *****************************************
  // * Users
  // *****************************************
  void updateUserStatus(Bill item, int listItemIndex) async {
    setState = LoadingState();

    final (bills, error) =
        await billRepository.updateUserStatus(item, listItemIndex);

    if (error != null) {
      if (error.code != 801) {
        setState = ErrorState(error);
        return;
      }
      // Show snackbar
    }
    setState = DataState(bills);
  }
}
