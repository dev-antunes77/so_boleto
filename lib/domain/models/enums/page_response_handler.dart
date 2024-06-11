import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum PageResponseHandler {
  error(AppIcons.error),
  noMorePromptBills(AppIcons.happy2),
  noneRegistered(AppIcons.sad2),
  noneDelayed(AppIcons.happy),
  noneForTheseFilters(AppIcons.disappointed2),
  nonePayed(AppIcons.worried1),
  noneWithThisName(AppIcons.disappointed1);

  const PageResponseHandler(this.value);
  final String value;

  String getTextResponse() {
    switch (this) {
      case error:
        return AppLocalizations.current.responseHandlerError;
      case noMorePromptBills:
        return AppLocalizations.current.responseHandlerNoMorePromptBills;
      case noneRegistered:
        return AppLocalizations.current.responseHandlerNoneRegistered;
      case noneDelayed:
        return AppLocalizations.current.responseHandlerNoneDelayed;
      case noneForTheseFilters:
        return AppLocalizations.current.responseHandlerNoneForTheseFilters;
      case nonePayed:
        return AppLocalizations.current.responseHandlerNonePayed;
      case noneWithThisName:
        return AppLocalizations.current.responseHandlerNoneWithThisName;
    }
  }
}
