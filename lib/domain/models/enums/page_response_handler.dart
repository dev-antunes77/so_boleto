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
        AppLocalizations.current.responseHandlerError;
      case noMorePromptBills:
        AppLocalizations.current.responseHandlerNoMorePromptBills;
      case noneRegistered:
        AppLocalizations.current.responseHandlerNoneRegistered;
      case noneDelayed:
        AppLocalizations.current.responseHandlerNoneDelayed;
      case noneForTheseFilters:
        AppLocalizations.current.responseHandlerNoneForTheseFilters;
      case nonePayed:
        AppLocalizations.current.responseHandlerNonePayed;
      case noneWithThisName:
        AppLocalizations.current.responseHandlerNoneWithThisName;
    }
    return '';
  }
}
