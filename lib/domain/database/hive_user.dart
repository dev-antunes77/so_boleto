import 'package:so_boleto/domain/models/user_data.dart';

abstract interface class HiveUser {
  Future<UserData?> getUser();
  Future<void> setUser(UserData user);
  Future<void> updateUser(UserData user);
  Future<void> removeUser(String userId);
  Future<String> checkUserPassword(String userId);
}
