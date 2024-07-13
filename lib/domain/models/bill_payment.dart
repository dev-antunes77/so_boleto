// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';

class BillPayment extends Equatable {
  BillPayment({
    this.payedAt = 'None',
    DateTime? referredMonth,
    BillStatus? billStatus,
  })  : referredMonth = referredMonth ?? DateTime.now(),
        billStatus = billStatus ?? BillStatus.open;

  final String payedAt;
  final DateTime referredMonth;
  final BillStatus billStatus;

  factory BillPayment.fromDynamicList(dynamic list) => BillPayment(
        payedAt: list.payedAt,
        referredMonth: list.referredMonth,
        billStatus: list.billStatus.billStatuToEnum(),
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'payedAt': payedAt,
      'referredMonth': referredMonth.millisecondsSinceEpoch,
      'billStatus': billStatus.value,
    };
  }

  factory BillPayment.fromMap(Map<String, dynamic> map) {
    return BillPayment(
      payedAt: map['payedAt'] as String,
      referredMonth:
          DateTime.fromMillisecondsSinceEpoch(map['referredMonth'] as int),
      billStatus: (map['billStatus'] as String).billStatuToEnum(),
    );
  }

  BillPayment copyWith({
    String? payedAt,
    DateTime? referredMonth,
    BillStatus? billStatus,
  }) {
    return BillPayment(
      payedAt: payedAt ?? this.payedAt,
      referredMonth: referredMonth ?? this.referredMonth,
      billStatus: billStatus ?? this.billStatus,
    );
  }

  @override
  List<Object?> get props => [
        payedAt,
        referredMonth,
        billStatus,
      ];
}
