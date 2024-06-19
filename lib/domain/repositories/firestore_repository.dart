import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/user.dart';

abstract interface class FirestoreRepository {
  Future<void> createUser(UserModel user);
  Future<void> addBill(BillModel bill);
  Future<BillModel> getBillModel(String id);
}
