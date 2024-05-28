import 'package:so_boleto/domain/models/enums/bill_state.dart';
import 'package:so_boleto/domain/models/enums/category.dart';

extension EnumExtensions on Enum {
  String categoryToText() => categoryMap.entries
      .firstWhere((element) => element.key == this)
      .value['string'];

  String billStateToText() => billStateMap.entries
      .firstWhere((element) => element.key == this)
      .value['string'];

  String enumToIcon() => categoryMap.entries
      .firstWhere((element) => element.key == this)
      .value['icon'];
}
