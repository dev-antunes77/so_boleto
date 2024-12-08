// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:so_boleto/core/errors/app_errors.dart';
// import 'package:so_boleto/core/l10n/generated/l10n.dart';
// import 'package:so_boleto/core/utils/log_utils.dart';
// import 'package:so_boleto/domain/models/user_data.dart';
// import 'package:so_boleto/domain/repositories/auth_repository.dart';

// class AuthService implements AuthRepository {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Future<String> signUp(String email, String password) async {
//     try {
//       final creds = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return creds.user?.uid ?? '';
//     } on AppError catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
//       rethrow;
//     } catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: $error');
//       throw ClientError(AppLocalizations.current.errorUnknowError);
//     }
//   }

//   @override
//   Future<String> signIn(String email, String password) async {
//     try {
//       final creds = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return creds.user?.uid ?? '';
//     } on AppError catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
//       rethrow;
//     } catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: $error');
//       throw ClientError(AppLocalizations.current.errorUnknowError);
//     }
//   }

//   @override
//   Future<void> sendPasswordResetEmail(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } on AppError catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
//       rethrow;
//     } catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: $error');
//       throw ClientError(AppLocalizations.current.errorUnknowError);
//     }
//   }

//   @override
//   Future<void> confirmPasswordReset(String code, String newPassword) async {
//     try {
//       await _auth.confirmPasswordReset(code: code, newPassword: newPassword);
//     } on AppError catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
//       rethrow;
//     } catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: $error');
//       throw ClientError(AppLocalizations.current.errorUnknowError);
//     }
//   }

//   @override
//   Future<void> logout() async {
//     try {
//       await _auth.signOut();
//     } on AppError catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
//       rethrow;
//     } catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: $error');
//       throw ClientError(AppLocalizations.current.errorUnknowError);
//     }
//   }

//   @override
//   Future<UserData?> getUser() {
//     // TODO: implement getUser
//     throw UnimplementedError();
//   }
// }
