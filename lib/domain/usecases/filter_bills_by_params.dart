import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/filter_params.dart';

final class FilterBillsByParams {
  FilterBillsByParams();
  static const parcels = 'parcels';
  static const dueDay = 'dueDay';
  static const value = 'value';

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

      billsByParecels =
          _filterNumericalRange(bills, parcels, params.parcelRange);
      billByDueDay = _filterNumericalRange(bills, dueDay, params.dueDayRange);

      if (params.priceRange.isNotEmpty) {
        final updatedPriceRange = [
          (params.priceRange.first * 100),
          (params.priceRange.last * 100)
        ];
        billByPriceRange =
            _filterNumericalRange(bills, value, updatedPriceRange);
      }

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
          List<BillModel> bills, String type, List<int> params) =>
      params.isEmpty
          ? []
          : bills.where((element) {
              if (type == parcels) {
                return _filterMatch(element.totalParcels, params);
              } else if (type == dueDay) {
                return _filterMatch(element.dueDayOfTheMonth, params);
              } else {
                return _filterMatch(element.value, params);
              }
            }).toList();

  bool _filterMatch(int value, List<int> range) =>
      value > range.first && value <= range.last;
}
