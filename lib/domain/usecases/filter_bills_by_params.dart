import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/filter_params.dart';

final class FilterBillsByParams {
  FilterBillsByParams();

  List<BillModel> call(List<BillModel> bills, FilterParams params) {
    try {
      List<BillModel> billsByParecels = [];
      List<BillModel> billByDueDay = [];
      List<BillModel> billByPriceRange = [];

      final billByCategory = bills
          .where(
            (element) => params.categoryList.contains(element.category),
          )
          .toList();

      billsByParecels = _filterNumericalRange(bills, params.parcelRange);
      billByDueDay = _filterNumericalRange(bills, params.dueDayRange);
      billByPriceRange = _filterNumericalRange(bills, params.priceRange);

      return billByCategory + billsByParecels + billByDueDay + billByPriceRange;
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }

  List<BillModel> _filterNumericalRange(
          List<BillModel> bills, List<int> params) =>
      params.isEmpty
          ? []
          : bills
              .where(
                (element) => _filterMatch(element.totalParcels, params),
              )
              .toList();

  bool _filterMatch(int value, List<int> range) =>
      value > range.first && value <= range.last;
}
