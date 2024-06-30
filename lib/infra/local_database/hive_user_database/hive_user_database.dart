import 'package:hive/hive.dart';
import 'package:so_boleto/domain/database/hive_user.dart';
import 'package:so_boleto/domain/database/open_box_mixin.dart';
import 'package:so_boleto/domain/models/user_data.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_data.dart';

final class HiveUserDatabase with OpneBoxMixin implements HiveUser {
  static const String _boxLabel = 'user';
  Box<UserData>? _box;

  @override
  Future<UserData?> getUser() async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveUser = (itemBox.values.toList().isEmpty)
        ? null
        : itemBox.values.first as HiveUserData;
    if (hiveUser != null) {
      return UserData.fromHiveUser(hiveUser);
    }
    return null;
  }

  @override
  Future<void> setUser(UserData user) async {
    final itemBox = await openBox(_box, _boxLabel);
    return itemBox.put(user.id, HiveUserData.fromUserModel(user));
  }

  @override
  Future<void> updateUser(UserData user) async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveList = itemBox.values.toList();
    final hiveItem = hiveList.where((element) => element.id == user.id);
    final hiveItemIndex = itemBox.values.toList().indexOf(hiveItem.first);
    return itemBox.putAt(hiveItemIndex, HiveUserData.fromUserModel(user));
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

  @override
  Future<String> checkUserPassword(String userId) async {
    final itemBox = await openBox(_box, _boxLabel);
    final hiveUser = (itemBox.values.toList().isEmpty)
        ? null
        : itemBox.values.first as HiveUserData;
    return hiveUser?.password ?? '';
  }
}
