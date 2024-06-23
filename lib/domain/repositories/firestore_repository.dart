import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';
import 'package:so_boleto/domain/models/user.dart';

abstract interface class FirestoreRepository {
  Future<void> createUser(UserModel user);
  Future<UserModel> getUser(String userId);
  Future<void> addBill(BillModel bill);
  Future<List<BillModel>> getBills(String userId);
  Future<void> editBill(BillModel bill);
  Future<bool> deleteBill(String userId, String billId);
  Future<void> addPrompBills(String userId, List<PromptBill> promptBills);
}
