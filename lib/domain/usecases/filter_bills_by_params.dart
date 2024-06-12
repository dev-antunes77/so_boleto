import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/filter_params.dart';

final class FilterBillsByParams {
  FilterBillsByParams();

  List<BillModel> call(List<BillModel> bills, FilterParams params) {
    try {
      final billByCategory = bills
          .where(
            (element) => params.categoryList.contains(element.category),
          )
          .toList();
      final billsByParecels = bills
          .where(
            (element) => _filterMatch(element.totalParcels, params.parcelRange),
          )
          .toList();
      final billByDueDay = bills
          .where(
            (element) =>
                _filterMatch(element.dueDayOfTheMonth, params.dueDayRange),
          )
          .toList();
      final billByPriceRange = bills
          .where(
            (element) => _filterMatch(element.value, params.priceRange),
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

  bool _filterMatch(int value, List<int> range) =>
      value > range.first && value <= range.last;
}
