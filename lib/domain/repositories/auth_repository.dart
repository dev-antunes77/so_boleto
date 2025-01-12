import 'package:firebase_auth/firebase_auth.dart';
import 'package:so_boleto/domain/models/user_data.dart';

abstract interface class AuthRepository {
  Future<UserData?> getUser();
  Future<void> signIn(String email, String password);
  Future<User?> signInWithGoogle();
  Future<void> signUp(String email, String password);
  Future<void> sendPasswordResetEmail(String email);
  Future<void> confirmPasswordReset(String code, String newPassword);
  Future<void> logout();
}
