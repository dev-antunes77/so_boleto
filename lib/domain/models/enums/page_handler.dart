import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum PageResponseHandler {
  error({
    'icon': AppIcons.error,
    'text': 'Ops!\nAlgo deu errado.',
  }),
  noneAdded({
    'icon': AppIcons.sad2,
    'text': 'Você não tem contas cadastradas.',
  }),
  noneDelayed({
    'icon': AppIcons.happy,
    'text': 'Você não tem contas atrasadas.',
  }),
  noneForTheseFilters({
    'icon': AppIcons.disappointed2,
    'text': 'Nenhuma conta com esses filtros',
  }),
  nonePayed({
    'icon': AppIcons.worried1,
    'text': 'Você não tem contas pagas.',
  }),
  noneWithThisName({
    'icon': AppIcons.disappointed1,
    'text': 'Nenhuma conta encontrada.',
  }),
  noneWithinThisDates({
    'icon': '',
    'text': '',
  });

  const PageResponseHandler(this.value);
  final Map<String, dynamic> value;
}
