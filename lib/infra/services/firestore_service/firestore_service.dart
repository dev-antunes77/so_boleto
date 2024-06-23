import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';

class FirestoreService implements FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _accessUsersBillCollection(
          String userId) =>
      _firestore.collection("users").doc(userId).collection('bills');

  @override
  Future<void> createUser(UserModel user) async {
    final usersRef = _firestore.collection("users").doc(user.id);
    await usersRef.set(user.toFirestore());
  }

  @override
  Future<UserModel> getUser(String userId) async {
    final docSnap = await _firestore.collection("users").doc(userId).get();
    return UserModel.fromFirestore(docSnap);
  }

  @override
  Future<void> addBill(BillModel bill) async {
    final usersRef = _accessUsersBillCollection(bill.userId).doc(bill.id);
    await usersRef.set(bill.toFirestore());
  }

  @override
  Future<List<BillModel>> getBills(String userId) async {
    List<BillModel> bills = [];
    await _accessUsersBillCollection(userId).get().then((snapDoc) {
      for (var data in snapDoc.docs) {
        bills.add(BillModel.fromFirestore(data));
      }
    });
    return bills;
  }

  @override
  Future<bool> deleteBill(String userId, String billId) async {
    try {
      await _accessUsersBillCollection(userId).doc(billId).delete();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<void> addPrompBills(
      String userId, List<PromptBill> promptBills) async {
    for (var promptBill in promptBills) {
      final bill = BillModel.fromPromptToBill(userId, promptBill);
      final usersRef = _accessUsersBillCollection(bill.userId).doc(bill.id);
      await usersRef.set(bill.toFirestore());
    }
  }

  @override
  Future<void> editBill(BillModel bill) async {
    await _accessUsersBillCollection(bill.userId).doc(bill.id).update(
          bill.toFirestore(),
        );
  }
}
