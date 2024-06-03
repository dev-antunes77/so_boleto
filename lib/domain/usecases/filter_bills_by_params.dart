import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/filter_params.dart';

final class FilterBillsByParamsUseCase {
  FilterBillsByParamsUseCase();

  List<BillModel> call(List<BillModel> bills, FilterParams params) {
    try {
      final billByCategory = bills
          .where(
            (element) => params.categoryList.contains(element.category),
          )
          .toList();
      final billsByParecels = bills
          .where(
            (element) => params.parcelRange.contains(element.totalParcels),
          )
          .toList();
      final billByDueDay = bills
          .where(
            (element) => params.dueDayRange.contains(element.dueDayOfTheMonth),
          )
          .toList();
      final billByPriceRange = bills
          .where(
            (element) => params.priceRange.contains(element.value),
          )
          .toList();
      return billByCategory + billsByParecels + billByDueDay + billByPriceRange;
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
