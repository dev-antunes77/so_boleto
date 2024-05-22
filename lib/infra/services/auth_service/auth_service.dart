// import 'package:so_boleto/core/errors/app_errors.dart';
// import 'package:so_boleto/core/l10n/generated/l10n.dart';
// import 'package:so_boleto/core/utils/log_utils.dart';
// import 'package:so_boleto/domain/models/user.dart';
// import 'package:so_boleto/domain/repositories/auth_repository.dart';

// class AuthService implements AuthRepository {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   bool isLoading = true;

//   @override
//   Future<UserModel?> getUser() async {
//     UserModel? user;
//     _auth.authStateChanges().listen((UserModel? fireUser) {
//       user = (fireUser == null) ? null : fireUser;
//     });
//     return user;
//   }

//   @override
//   Future<void> signIn(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on AppError catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
//       rethrow;
//     } catch (error, trace) {
//       Log.error(error, trace, 'Error executing $runtimeType: $error');
//       throw ClientError(AppLocalizations.current.errorUnknowError);
//     }
//   }

//   @override
//   Future<void> signUp(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
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
// }
