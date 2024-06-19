import 'package:hive/hive.dart';
import 'package:so_boleto/domain/database/hive_user.dart';
import 'package:so_boleto/domain/database/open_box_mixin.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_model.dart';

final class HiveUserDatabase with OpneBoxMixin implements HiveUser {
  static const String _boxLabel = 'user';
  Box<UserModel>? _box;

  @override
  Future<UserModel>? getUser() async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveUser = itemBox as HiveUserModel;
    return UserModel.fromHiveUser(hiveUser);
  }

  @override
  Future<void> setUser(UserModel user) async {
    final itemBox = await openBox(_box, _boxLabel);
    return itemBox.put(user.userId, HiveUserModel.fromUserModel(user));
  }
}
