import 'package:so_boleto/domain/models/user.dart';

abstract interface class HiveUser {
  Future<UserModel>? getUser();
  Future<void> setUser(UserModel user);
}
