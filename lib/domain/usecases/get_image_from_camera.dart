import 'package:image_picker/image_picker.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/repositories/image_repository.dart';

final class GetImageFromCamera {
  GetImageFromCamera(this._imageRepository);

  final ImageRepository _imageRepository;

  Future<XFile?> call() async {
    try {
      return await _imageRepository.pickImageFromCamera();
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
