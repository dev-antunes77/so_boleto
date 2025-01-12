import 'package:firebase_auth/firebase_auth.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/repositories/auth_repository.dart';

final class SignInWithGgogle {
  SignInWithGgogle(this._authRepository);

  final AuthRepository _authRepository;

  Future<User?> call() async {
    try {
      return await _authRepository.signInWithGoogle();
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
