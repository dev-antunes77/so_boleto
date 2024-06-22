import 'package:hive/hive.dart';
import 'package:so_boleto/domain/database/hive_bills.dart';
import 'package:so_boleto/domain/database/open_box_mixin.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bill_model.dart';

final class HiveBillsDatabase with OpneBoxMixin implements HiveBills {
  static const String _boxLabel = 'bills';
  Box<HiveBillModel>? _box;

  @override
  Future<List<BillModel>> getBills() async {
    final itemBox = await openBox(_box, _boxLabel);
    final list = itemBox.values.toList();
    List<BillModel> billList = [];
    for (HiveBillModel bill in list) {
      billList.add(BillModel.fromHiveBillModel(bill));
    }
    return billList.reversed.toList();
  }

  @override
  Future<void> createBill(BillModel bill) async {
    final itemBox = await openBox(_box, _boxLabel);
    return itemBox.put(bill.id, HiveBillModel.fromBillModel(bill));
  }

  @override
  Future<void> editBill(BillModel bill) async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveList = itemBox.values.toList();
    final hiveItem = hiveList.firstWhere((element) => element.id == bill.id);
    final hiveItemIndex = itemBox.values.toList().indexOf(hiveItem);
    return itemBox.putAt(hiveItemIndex, HiveBillModel.fromBillModel(bill));
  }

  @override
  Future<bool> deleteBill(String id) async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveList = itemBox.values.toList();
    final hasId = hiveList.any((element) => element.id == id);
    if (hasId) {
      itemBox.delete(id);
      return true;
    }
    return false;
  }

  // @override
  // Future<void> addPrompBills(List<PromptBill> promptBills) async {
  //   final itemBox = await openBox(_box, _boxLabel);
  //   List<BillModel> newBills = [];
  //   for (var promptBill in promptBills) {
  //     final bill = BillModel.fromPromptToBill(promptBill);
  //     newBills.add(bill);
  //     itemBox.put(bill.id, HiveBillModel.fromBillModel(bill));
  //   }
  // }
}
