import 'package:hive/hive.dart';
import 'package:so_boleto/domain/database/hive_bills.dart';
import 'package:so_boleto/domain/database/open_box_mixin.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/infra/local_database/hive_database/hive_bill_model.dart';

final class HiveBillsDatabase with OpneBoxMixin implements HiveBills {
  static const String _boxLabel = 'bills';
  Box<HiveBillModel>? _box;

  @override
  Future<List<BillModel>> getBills() async {
    final itemBox = await openBox(_box, _boxLabel);
    return itemBox.values.toList() as List<BillModel>;
  }

  @override
  Future<void> createBill(BillModel bill) async {
    final itemBox = await openBox(_box, _boxLabel);
    return itemBox.put(bill.hiveIndex, HiveBillModel.fromBillModel(bill));
  }

  @override
  Future<void> updateBill(BillModel bill) async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveList = itemBox.values.toList();
    final hiveItem =
        hiveList.firstWhere((element) => element.hiveIndex == bill.hiveIndex);
    final hiveItemIndex = itemBox.values.toList().indexOf(hiveItem);
    return itemBox.putAt(hiveItemIndex, HiveBillModel.fromBillModel(bill));
  }

  @override
  Future<void> removeBill(int hiveIndex) async {
    final itemBox = await openBox(_box, _boxLabel);
    return itemBox.delete(hiveIndex);
  }
}
