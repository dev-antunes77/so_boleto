import 'package:hive_flutter/hive_flutter.dart';

mixin OpneBoxMixin {
  Future<Box<dynamic>> openBox(Box<dynamic>? box, String boxLabel) async {
    if (box == null) {
      final isOpen = Hive.isBoxOpen(boxLabel);
      box = isOpen ? Hive.box(boxLabel) : await Hive.openBox(boxLabel);
    }
    return box;
  }
}
