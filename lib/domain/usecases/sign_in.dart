import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_database.dart';

final class SignIn {
  SignIn(this._hiveUserDatabase);

  final HiveUserDatabase _hiveUserDatabase;

  Future<UserModel?> call() async {
    try {
      return _hiveUserDatabase.getUser();
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
