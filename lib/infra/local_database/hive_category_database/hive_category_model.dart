// // ignore_for_file: must_be_immutable

// import 'package:hive/hive.dart';
// import 'package:so_boleto/domain/models/enums/category.dart';

// part 'hive_category_model.g.dart';

// class HiveCategoryAdapter extends TypeAdapter<Category> with HiveObjectMixin{
//   @override
//   final int typeId = 2;

//   @override
//   Category read(BinaryReader reader) {
//     return Category.values[reader.readByte()];
//   }

//   @override
//   void write(BinaryWriter writer, Category obj) {
//     writer.writeByte(obj.index);
//   }
// }
