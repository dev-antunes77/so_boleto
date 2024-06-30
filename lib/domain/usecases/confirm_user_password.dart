import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_database.dart';

final class ConfirmUserPassword {
  ConfirmUserPassword(this._hiveUserDatabase);

  final HiveUserDatabase _hiveUserDatabase;

  Future<bool> call(String userId, String password) async {
    try {
      final hivePassword = await _hiveUserDatabase.checkUserPassword(userId);
      final decodedPassword = hivePassword.decodePassword();
      return decodedPassword == password;
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
