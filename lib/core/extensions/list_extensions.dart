import 'package:so_boleto/domain/models/bill.dart';

extension ListExtensions on List {
  List<BillModel> filterBills(String query) => where(
          (element) => element.name.toLowerCase().contains(query.toLowerCase()))
      .toList() as List<BillModel>;
}
