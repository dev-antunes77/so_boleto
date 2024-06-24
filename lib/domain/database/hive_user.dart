import 'package:so_boleto/domain/models/user.dart';

abstract interface class HiveUser {
  Future<UserModel?> getUser();
  Future<void> setUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> removeUser(String userId);
}
