import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_database.dart';

final class ClearUserStorage {
  ClearUserStorage(this._hiveUserDatabase);

  final HiveUserDatabase _hiveUserDatabase;

  Future<bool> call(String userId) async {
    try {
      await _hiveUserDatabase.removeUser(userId);
      return true;
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
