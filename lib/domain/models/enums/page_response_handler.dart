import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum PageResponseHandler {
  error(AppIcons.error),
  noMorePromptBills(AppIcons.noneForPrompt),
  noneRegistered(AppIcons.noneRegistered),
  noneDelayed(AppIcons.noneDelayed),
  noneFutureBills(AppIcons.noneFutureBills),
  noneForTheseFilters(AppIcons.noneForFilters),
  nonePayed(AppIcons.nonePayed),
  noneWithThisName(AppIcons.noneForName);

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
      case noneFutureBills:
        return AppLocalizations.current.responseHandlerNoneFutureBills;
      case noneForTheseFilters:
        return AppLocalizations.current.responseHandlerNoneForTheseFilters;
      case nonePayed:
        return AppLocalizations.current.responseHandlerNonePayed;
      case noneWithThisName:
        return AppLocalizations.current.responseHandlerNoneWithThisName;
    }
  }
}
