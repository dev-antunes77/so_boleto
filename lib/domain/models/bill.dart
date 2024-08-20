import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/date_time_extensions.dart';
import 'package:so_boleto/core/extensions/iterable_extensions.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/domain/models/bill_payment.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bill_model.dart';

class BillModel extends Equatable {
  BillModel({
    this.name = '',
    this.description = '',
    this.totalParcels = 0,
    this.value = 0,
    this.payedParcels = 0,
    this.dueDay = 0,
    this.userId = '',
    List<BillPayment>? billPayment,
    String? id,
    BillCategory? category,
    DateTime? createdAt,
  })  : id = id ?? AppFormatters.randomIdFormater(),
        createdAt = createdAt ?? AppConstants.currentDate,
        billPayment = billPayment ??
            [BillPayment(referredMonth: AppConstants.currentDate)],
        category = category ?? BillCategory.miscellaneous;

  Map<String, dynamic> toFirestore() => <String, dynamic>{
        'id': id,
        'userId': userId,
        'name': name,
        'description': description,
        'category': category.value,
        'billPayment': billPayment.map((e) => e.toMap()),
        'value': value,
        'totalParcels': totalParcels,
        'payedParcels': payedParcels,
        'dueDay': dueDay,
        'createdAt': createdAt.dateTimeToStringData(),
      };

  factory BillModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data();
    return BillModel(
      id: data?['id'],
      name: data?['name'],
      description: data?['description'],
      category: (data?['category'] as String).categoryToEnum(),
      value: data?['value'],
      payedParcels: data?['payedParcels'],
      totalParcels: data?['totalParcels'],
      billPayment: (data?['billPayment'])
          .map((e) => BillPayment.fromMap(e))
          .cast<BillPayment>()
          .toList(),
      dueDay: data?['dueDay'],
      userId: data?['userId'],
      createdAt: (data?['createdAt'] as String).stringToDateTime(),
    );
  }

  factory BillModel.fromHiveBillModel(HiveBillModel bill) => BillModel(
        id: bill.id,
        name: bill.name,
        description: bill.description,
        category: bill.category.categoryToEnum(),
        totalParcels: bill.totalParcels,
        payedParcels: bill.payedParcels,
        value: bill.value,
        dueDay: bill.dueDay,
        createdAt: bill.createdAt,
      );

  factory BillModel.fromPromptToBill(String userId, PromptBill promptBill) =>
      BillModel(
        id: promptBill.id,
        userId: userId,
        name: promptBill.name,
        description: '',
        category: promptBill.category,
        totalParcels: 0,
        payedParcels: 0,
        billPayment: [BillPayment()],
        value: promptBill.value,
        dueDay: promptBill.dueDay,
        createdAt: AppConstants.currentDate,
      );

  final String id;
  final String userId;
  final String name;
  final String description;
  final BillCategory category;
  final int value;
  final DateTime createdAt;
  final int dueDay;
  final List<BillPayment> billPayment;
  final int totalParcels;
  final int payedParcels;

  int get parcelsLeft => totalParcels - payedParcels;

  String get lastParcelDate {
    DateTime lastMonth = createdAt;
    for (var i = 0; i < totalParcels; i++) {
      lastMonth = lastMonth.changeMonth(isAddition: true);
    }
    return DateFormat('MMMM yyyy').format(lastMonth).capitalize();
  }

  double get totalValue => (value * totalParcels).toDouble();

  double get totalPayedValue => (value * payedParcels).toDouble();

  double get totalUnpayedValue => totalValue - (value * payedParcels);

  String get totalPayedStringValue =>
      payedParcels == 0 ? '0' : totalPayedValue.formatCurrency();

  /// When no date is provided, the fucntion will work on the current date
  /// If a date is provided, the function will work on the date provided
  bool isMonthPayed({DateTime? date}) =>
      _paymentList(date)
          .firstWhereOrNull((e) => e.billStatus.isPayed)
          ?.billStatus
          .isPayed ??
      false;

  List<BillPayment> _paymentList(DateTime? date) => billPayment
      .where((e) =>
          e.referredMonth.month == (date ?? AppConstants.currentDate).month)
      .toList();

  bool isMonthDelayed({DateTime? date}) =>
      _paymentList(date)
          .firstWhereOrNull((e) => e.billStatus.isDelayed)
          ?.billStatus
          .isDelayed ??
      false;

  bool checkReferredMonth(DateTime date) =>
      billPayment.any((e) => e.referredMonth.month == date.month);

  String getPaymentDate(DateTime? date) =>
      _paymentList(date)
          .firstWhereOrNull((e) => e.billStatus.isPayed)
          ?.payedAt ??
      '';

  void updateBillPayment(DateTime date, BillStatus newStatus) {
    for (var payment in billPayment) {
      if (payment.referredMonth.month == date.month) {
        var newPayment = payment.copyWith(
          billStatus: newStatus,
          payedAt: newStatus.isPayed
              ? AppConstants.currentDate.getFormattedCreatedAt()
              : '',
        );
        billPayment.insert(billPayment.indexOf(payment), newPayment);
        billPayment.remove(payment);
      }
    }
  }

  int daysTillOrAfterDueDay(DateTime endDate) {
    final presentDay = DateTime(
        AppConstants.currentDate.year, AppConstants.currentDate.month, dueDay);
    return endDate.difference(presentDay).inDays;
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        description,
        category,
        value,
        createdAt,
        dueDay,
        billPayment,
        totalParcels,
        payedParcels,
      ];

  BillModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? description,
    BillCategory? category,
    int? value,
    DateTime? createdAt,
    int? dueDay,
    List<BillPayment>? billPayment,
    int? totalParcels,
    int? payedParcels,
  }) {
    return BillModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      billPayment: billPayment ?? this.billPayment,
      dueDay: dueDay ?? this.dueDay,
      totalParcels: totalParcels ?? this.totalParcels,
      payedParcels: payedParcels ?? this.payedParcels,
    );
  }
}
