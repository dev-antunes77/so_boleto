import 'package:so_boleto/domain/models/enums/category.dart';

extension EnumExtensions on Enum {
  String enumToText() => categoryMap.entries
      .firstWhere((element) => element.key == this)
      .value['string'];

  String enumToIcon() => categoryMap.entries
      .firstWhere((element) => element.key == this)
      .value['icon'];
}
