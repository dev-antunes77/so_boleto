import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_database.dart';
import 'package:so_boleto/infra/services/auth_service/auth_service.dart';

final class SignIn {
  SignIn(this._hiveUserDatabase, this._authService);

  final HiveUserDatabase _hiveUserDatabase;
  final AuthService _authService;

  Future<void> call(String email, String password) async {
    try {
      await _authService.signIn(email, password);
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
