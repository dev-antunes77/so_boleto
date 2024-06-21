import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';

final class GetUserFromFirebase {
  GetUserFromFirebase(this._firestoreRepository);

  final FirestoreRepository _firestoreRepository;

  Future<UserModel?> call(String? userId, String? email) async {
    try {
      return await _firestoreRepository.getUser(userId, email);
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
