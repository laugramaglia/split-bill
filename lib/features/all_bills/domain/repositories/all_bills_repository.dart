import 'package:hive/hive.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/domain/repositories/all_bills_hive_box.dart';
import 'package:split_bill/services/app_exeption.dart';

class AllBillRepository {
  // *****************************************
  // * List of bills
  // *****************************************
  Future<(AllBills, AppException?)> getAllBills() async {
    try {
      final allBills = AllBillsHiveBox.instance.getAllBills();
      await Future.delayed(const Duration(milliseconds: 10));
      return (allBills, null);
    } on HiveError catch (e) {
      return (<Bill>[], AppException(message: e.message, code: 600));
    } catch (e) {
      return (<Bill>[], AppException(message: e.toString(), code: 400));
    }
  }

  Future<(AllBills, AppException?)> addBill(Bill bill) async {
    try {
      await AllBillsHiveBox.instance.addToBox(bill);
      final allBills = AllBillsHiveBox.instance.getAllBills();
      if (allBills.isEmpty) {
        return (<Bill>[], AppException(message: 'Empty', code: 400));
      }
      await Future.delayed(const Duration(milliseconds: 10));
      return (allBills, null);
    } on HiveError catch (e) {
      return (<Bill>[], AppException(message: e.message, code: 600));
    } catch (e) {
      return (<Bill>[], AppException(message: e.toString(), code: 400));
    }
  }

  Future<(AllBills, AppException?)> updateBill(key, Bill bill) async {
    try {
      await AllBillsHiveBox.instance.updateBill(key, bill);

      final allBills = AllBillsHiveBox.instance.getAllBills();
      return (allBills, null);
    } on HiveError catch (e) {
      return (<Bill>[], AppException(message: e.message, code: 600));
    } catch (e) {
      return (<Bill>[], AppException(message: e.toString(), code: 400));
    }
  }

  Future<(AllBills, AppException?)> deleteBill(Bill bill) async {
    try {
      await bill.delete();
      final allBills = AllBillsHiveBox.instance.getAllBills();
      return (allBills, null);
    } on HiveError catch (e) {
      return (<Bill>[], AppException(message: e.message, code: 600));
    } catch (e) {
      return (<Bill>[], AppException(message: e.toString(), code: 400));
    }
  }

  // *****************************************

  // *****************************************
  // * Users
  // *****************************************
  Future<(AllBills, AppException?)> updateUserStatus(
      Bill item, int listItemIndex) async {
    try {
      await item.save();
      final allBills = AllBillsHiveBox.instance.getAllBills();
      return (allBills, null);
    } on HiveError catch (e) {
      return (<Bill>[], AppException(message: e.message, code: 600));
    } catch (e) {
      return (<Bill>[], AppException(message: e.toString(), code: 400));
    }
  }
}
