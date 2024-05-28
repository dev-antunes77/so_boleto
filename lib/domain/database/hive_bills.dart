import 'package:so_boleto/domain/models/bill.dart';

abstract interface class HiveBills {
  Future<List<BillModel>> getBills();
  Future<void> createBill(BillModel bill);
  Future<void> updateBill(BillModel bill);
  Future<void> deleteBill(String id);
}
