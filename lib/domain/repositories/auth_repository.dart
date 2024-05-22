import 'package:so_boleto/domain/models/user.dart';

abstract interface class AuthRepository {
  Future<UserModel?> getUser();
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> logout();
}
