import 'package:hive/hive.dart';
import 'package:so_boleto/domain/database/hive_user.dart';
import 'package:so_boleto/domain/database/open_box_mixin.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_model.dart';

final class HiveUserDatabase with OpneBoxMixin implements HiveUser {
  static const String _boxLabel = 'user';
  Box<UserModel>? _box;

  @override
  Future<UserModel?> getUser() async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveUser = (itemBox.values.toList().isEmpty)
        ? null
        : itemBox.values.first as HiveUserModel;
    if (hiveUser != null) {
      return UserModel.fromHiveUser(hiveUser);
    }
    return null;
  }

  @override
  Future<void> setUser(UserModel user) async {
    final itemBox = await openBox(_box, _boxLabel);
    return itemBox.put(user.id, HiveUserModel.fromUserModel(user));
  }

  @override
  Future<void> updateUser(UserModel user) async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveList = itemBox.values.toList();
    final hiveItem = hiveList.where((element) => element.id == user.id);
    final hiveItemIndex = itemBox.values.toList().indexOf(hiveItem.first);
    return itemBox.putAt(hiveItemIndex, HiveUserModel.fromUserModel(user));
  }

  @override
  Future<void> removeUser(String userId) async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveList = itemBox.values.toList();
    final hasId = hiveList.any((element) => element.id == userId);
    if (hasId) {
      itemBox.delete(userId);
    }
  }
}
