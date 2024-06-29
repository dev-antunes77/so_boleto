import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/user_data.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';

final class CreateUser {
  CreateUser(this._firestoreRepository);

  final FirestoreRepository _firestoreRepository;

  Future<void> call(UserData user) async {
    try {
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
