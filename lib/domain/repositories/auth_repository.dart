import 'package:so_boleto/domain/models/user_data.dart';

abstract interface class AuthRepository {
  Future<UserData?> getUser();
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> logout();
}
