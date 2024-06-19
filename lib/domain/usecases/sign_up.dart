import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';
import 'package:so_boleto/infra/local_database/hive_user_database/hive_user_database.dart';
import 'package:so_boleto/infra/services/auth_service/auth_service.dart';

final class SignUp {
  SignUp(this._hiveUserDatabase, this._firestoreRepository, this._authService);

  final HiveUserDatabase _hiveUserDatabase;
  final FirestoreRepository _firestoreRepository;
  final AuthService _authService;

  Future<void> call(UserModel user) async {
    try {
      await _authService.signUp(user.email, user.password);
      await _hiveUserDatabase.setUser(user);
      await _firestoreRepository.createUser(user);
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
