import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';

class FirestoreService implements FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user) async {
    final usersRef = _firestore.collection("users").doc(user.id);
    await usersRef.set(user.toFirestore());
  }

  @override
  Future<UserModel> getUser(String? userId, String? email) async {
    if (userId != null) {
      final docSnap = await _firestore.collection("users").doc(userId).get();
      return UserModel.fromFirestore(docSnap);
    }
    late QueryDocumentSnapshot<Map<String, dynamic>> userDoc;
    await _firestore
        .collection("users")
        .where('email', isEqualTo: email!)
        .get()
        .then((querySnapshot) => userDoc = querySnapshot.docs.first);
    return UserModel.fromFirestore(userDoc);
  }

  @override
  Future<void> addBill(BillModel bill) async {
    final usersRef = _firestore
        .collection("users")
        .doc(bill.userId)
        .collection('bills')
        .doc(bill.id);
    await usersRef.set(bill.toFirestore());
  }

  @override
  Future<List<BillModel>> getBills(String userId) async {
    List<BillModel> bills = [];
    await _firestore
        .collection("users")
        .doc(userId)
        .collection('bills')
        .get()
        .then((snapDoc) {
      for (var data in snapDoc.docs) {
        bills.add(BillModel.fromFirestore(data));
      }
    });
    return bills;
  }
}
