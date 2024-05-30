import 'package:so_boleto/core/theme/settings/app_icons.dart';

enum MessageHandler {
  error,
  noneAdded,
  noneDelayed,
  noneForTheseFilters,
  nonePayed,
  noneWithThisName,
  noneWithinThisDates,
}

const Map<MessageHandler, dynamic> messageHandlerMap = {
  MessageHandler.error: {
    'icon': AppIcons.error,
    'string': 'Ops!\nAlgo deu errado.',
  },
  MessageHandler.noneAdded: {
    'icon': AppIcons.sad2,
    'string': 'Você não tem contas cadastradas.',
  },
  MessageHandler.noneDelayed: {
    'icon': AppIcons.happy,
    'string': 'Você não tem contas atrasadas.',
  },
  MessageHandler.noneForTheseFilters: {
    'icon': '',
    'string': '',
  },
  MessageHandler.nonePayed: {
    'icon': AppIcons.worried1,
    'string': 'Você não tem contas pagas.',
  },
  MessageHandler.noneWithThisName: {
    'icon': AppIcons.disappointed1,
    'string': 'Nenhuma conta encontrada.',
  },
  MessageHandler.noneWithinThisDates: {
    'icon': '',
    'string': '',
  },
};
