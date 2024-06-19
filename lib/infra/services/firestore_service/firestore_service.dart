import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';

class FirestoreService implements FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user) async {
    await _firestore.collection('data/user').add(user.toJson());
  }

  @override
  Future<void> addBill(BillModel bill) async {
    await _firestore.collection('data/user').add(bill.toJson());
  }

  @override
  Future<BillModel> getBillModel(String id) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('bills').doc(id).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) {
      throw Exception('Bill not found in Firestore');
    }
    return BillModel(
      id: id,
      name: data['name'],
      description: data['description'],
      totalParcels: data['totalParcels'],
      value: data['value'],
      payedParcels: data['payedParcels'],
      dueDayOfTheMonth: data['dueDayOfTheMonth'],
      dueEveryMonth: data['dueEveryMonth'],
      createdAt: (data['createdAt'] as String).stringToDateTime(),
      category: (data['category'] as String).categoryToEnum(),
      billStatus: (data['billStatus'] as String).billStatuToEnum(),
    );
  }
}
