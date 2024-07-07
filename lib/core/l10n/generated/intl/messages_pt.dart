// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(user) => "Tem certeza que deseja deslogar deslogar, ${user}";

  static String m1(range) => "depois do dia ${range}";

  static String m2(range) => "antes do dia ${range}";

  static String m3(range1, range2) => "entre os dias ${range1} e ${range2}";

  static String m4(fisrtRange, lastRange) => "de ${fisrtRange} a ${lastRange}";

  static String m5(parcelNumber) => "mais de ${parcelNumber}";

  static String m6(parcelNumber) => "${parcelNumber} ou menos";

  static String m7(parcelNumber) => "${parcelNumber} parcelas";

  static String m8(payedParcels, parcels) => "${payedParcels} de ${parcels}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appNameHalf1": MessageLookupByLibrary.simpleMessage("Só"),
        "appNameHalf2": MessageLookupByLibrary.simpleMessage("Boleto"),
        "back": MessageLookupByLibrary.simpleMessage("Voltar"),
        "billFlowAddToPayed":
            MessageLookupByLibrary.simpleMessage("Adicionar às contas pagas"),
        "billFlowBillEdition":
            MessageLookupByLibrary.simpleMessage("Edição da conta"),
        "billFlowCheckCategory":
            MessageLookupByLibrary.simpleMessage("Categoria"),
        "billFlowCheckDescription":
            MessageLookupByLibrary.simpleMessage("Descrição:"),
        "billFlowCheckDueDay":
            MessageLookupByLibrary.simpleMessage("Vencimento:"),
        "billFlowCheckName": MessageLookupByLibrary.simpleMessage("Name:"),
        "billFlowCheckValue": MessageLookupByLibrary.simpleMessage("Valor:"),
        "billFlowDescription":
            MessageLookupByLibrary.simpleMessage("Descrição da conta"),
        "billFlowDueDayTitle":
            MessageLookupByLibrary.simpleMessage("Dia do vencimento"),
        "billFlowFixedSwitch": MessageLookupByLibrary.simpleMessage(
            "Essa é uma conta mensal fixa?"),
        "billFlowHowManyParcels":
            MessageLookupByLibrary.simpleMessage("Quantas parcelas?"),
        "billFlowName": MessageLookupByLibrary.simpleMessage("Nome da conta"),
        "billFlowNewBill": MessageLookupByLibrary.simpleMessage("Nova conta"),
        "billFlowOptional": MessageLookupByLibrary.simpleMessage("(Opcional)"),
        "billFlowParcelValue":
            MessageLookupByLibrary.simpleMessage("(Valor da parcela)"),
        "billFlowParceledSwitch": MessageLookupByLibrary.simpleMessage(
            "Ou uma conta mensal parcelada?"),
        "billFlowRemoveFromPayed":
            MessageLookupByLibrary.simpleMessage("Remover das contas pagas"),
        "billFlowValueTitle":
            MessageLookupByLibrary.simpleMessage("Valor da conta"),
        "categoryAutomobile": MessageLookupByLibrary.simpleMessage("Automóvel"),
        "categoryCreditCard":
            MessageLookupByLibrary.simpleMessage("Cartão de crédito"),
        "categoryDebt": MessageLookupByLibrary.simpleMessage("Dívida"),
        "categoryDevices": MessageLookupByLibrary.simpleMessage("Eletrônicos"),
        "categoryEducation": MessageLookupByLibrary.simpleMessage("Educação"),
        "categoryElectricity": MessageLookupByLibrary.simpleMessage("Luz"),
        "categoryEntertainment":
            MessageLookupByLibrary.simpleMessage("Entretenimento"),
        "categoryGas": MessageLookupByLibrary.simpleMessage("Gás"),
        "categoryGroceries": MessageLookupByLibrary.simpleMessage("Mercado"),
        "categoryHealthCare": MessageLookupByLibrary.simpleMessage("Saúde"),
        "categoryInsurance": MessageLookupByLibrary.simpleMessage("Seguro"),
        "categoryInternet": MessageLookupByLibrary.simpleMessage("Internet"),
        "categoryInvestment":
            MessageLookupByLibrary.simpleMessage("Investimento"),
        "categoryMiscellaneous":
            MessageLookupByLibrary.simpleMessage("Diversos"),
        "categoryRent": MessageLookupByLibrary.simpleMessage("Aluguel"),
        "categoryTelephone": MessageLookupByLibrary.simpleMessage("telefone"),
        "categoryTransportation":
            MessageLookupByLibrary.simpleMessage("Transporte"),
        "categoryTravel": MessageLookupByLibrary.simpleMessage("Viagem"),
        "categoryWater": MessageLookupByLibrary.simpleMessage("Água"),
        "categorypetShop": MessageLookupByLibrary.simpleMessage("Pet shop"),
        "close": MessageLookupByLibrary.simpleMessage("Encerrar"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "continueButton": MessageLookupByLibrary.simpleMessage("Continuar"),
        "dialogBillFlowLeaveBill":
            MessageLookupByLibrary.simpleMessage("Tem certeza?"),
        "dialogBillFlowLeaveBillText": MessageLookupByLibrary.simpleMessage(
            "Se sair,\na criação dessa conta será perdida."),
        "dialogDeleteBill": MessageLookupByLibrary.simpleMessage(
            "Deseja mesmo deletar essa conta?"),
        "dialogLeaveApp": MessageLookupByLibrary.simpleMessage("Sair do app?"),
        "dialogLeaveAppText": MessageLookupByLibrary.simpleMessage(
            "Tem certeza que deseja\nsair do app?"),
        "dialogOnboardingSkip":
            MessageLookupByLibrary.simpleMessage("Pular boas vindas?"),
        "dialogOnboardingSkipText": MessageLookupByLibrary.simpleMessage(
            "Tem certeza que deseja pular a tela de boas vindas?"),
        "dialogProfileLogout": MessageLookupByLibrary.simpleMessage("Sair?"),
        "dialogProfileLogoutText": m0,
        "done": MessageLookupByLibrary.simpleMessage("Pronto"),
        "dueDayExtensionsDay": MessageLookupByLibrary.simpleMessage("dia"),
        "dueDayExtensionsDays": MessageLookupByLibrary.simpleMessage("dias"),
        "dueDayExtensionsDelayedSince":
            MessageLookupByLibrary.simpleMessage("Vencida há"),
        "dueDayExtensionsDueIn":
            MessageLookupByLibrary.simpleMessage("Vence em"),
        "dueDayExtensionsDueToday":
            MessageLookupByLibrary.simpleMessage("Vence hoje"),
        "error": MessageLookupByLibrary.simpleMessage("Erro"),
        "errorNoConnectionPage":
            MessageLookupByLibrary.simpleMessage("Sem conexão"),
        "errorUnknowError":
            MessageLookupByLibrary.simpleMessage("Tente novamente"),
        "expenses": MessageLookupByLibrary.simpleMessage("Gastos"),
        "expensesForSixMonth":
            MessageLookupByLibrary.simpleMessage("Gastos dos últimos 6 meses"),
        "expensesForThisMonth":
            MessageLookupByLibrary.simpleMessage("Gastos deste mês"),
        "expensesForThreeMonth":
            MessageLookupByLibrary.simpleMessage("Gastos dos últimos 3 meses"),
        "filter": MessageLookupByLibrary.simpleMessage("Filtros"),
        "filterApply": MessageLookupByLibrary.simpleMessage("Aplicar"),
        "filterByCategory":
            MessageLookupByLibrary.simpleMessage("Por categoria"),
        "filterDueDay": MessageLookupByLibrary.simpleMessage("Vencimento"),
        "filterRemove": MessageLookupByLibrary.simpleMessage("Remover filtros"),
        "filterSee": MessageLookupByLibrary.simpleMessage("Ver filtros"),
        "filterValue": MessageLookupByLibrary.simpleMessage("Valor"),
        "formatterDayAfter": m1,
        "formatterDayBefore": m2,
        "formatterDayBetween": m3,
        "formatterMonth": MessageLookupByLibrary.simpleMessage("Mensal fixa"),
        "formatterMonthBill":
            MessageLookupByLibrary.simpleMessage("Conta fixa"),
        "formatterParcelsFromTo": m4,
        "formatterParcelsMoreThan": m5,
        "formatterParcelsOrLess": m6,
        "formatterParcelsTimes": m7,
        "formatterPayedParcelsOfParcels": m8,
        "homeAppBarAddNewBill":
            MessageLookupByLibrary.simpleMessage("Adicionar conta nova"),
        "homeAppBarAddPromptBills":
            MessageLookupByLibrary.simpleMessage("Adicionar contas prontas"),
        "homeAppBarOrder": MessageLookupByLibrary.simpleMessage("Ordenar"),
        "homeAppBarOrderByDueDay":
            MessageLookupByLibrary.simpleMessage("Por vencimento"),
        "homeAppBarOrderByName":
            MessageLookupByLibrary.simpleMessage("Por nome"),
        "homeAppBarOrderByValue":
            MessageLookupByLibrary.simpleMessage("Por valor"),
        "homeAppBarTitle": MessageLookupByLibrary.simpleMessage("Suas contas"),
        "homeBillActionError": MessageLookupByLibrary.simpleMessage(
            "Ops! Não foi possível realizar essa ação."),
        "homeBillCreationError":
            MessageLookupByLibrary.simpleMessage("Erro ao criar a conta"),
        "homeBillDeleting":
            MessageLookupByLibrary.simpleMessage("Deletando..."),
        "homeBillEditionError":
            MessageLookupByLibrary.simpleMessage("Erro ao editar a conta"),
        "homeBillPaying": MessageLookupByLibrary.simpleMessage("Pagando..."),
        "homeTabAll": MessageLookupByLibrary.simpleMessage("Todas"),
        "homeTabDelayed": MessageLookupByLibrary.simpleMessage("Atrasadas"),
        "homeTabPayed": MessageLookupByLibrary.simpleMessage("Pagas"),
        "loginEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "loginHasAccountAlready":
            MessageLookupByLibrary.simpleMessage("Já possui conta?  "),
        "loginHere": MessageLookupByLibrary.simpleMessage("Aqui"),
        "loginName": MessageLookupByLibrary.simpleMessage("Nome"),
        "loginNoAccount": MessageLookupByLibrary.simpleMessage(
            "Ainda não tem conta? Cadastre-se  "),
        "loginPassword": MessageLookupByLibrary.simpleMessage("Senha"),
        "loginSurename": MessageLookupByLibrary.simpleMessage("Sobrenome"),
        "no": MessageLookupByLibrary.simpleMessage("Não"),
        "onboardingAgility": MessageLookupByLibrary.simpleMessage("Agilidade"),
        "onboardingAgilityText": MessageLookupByLibrary.simpleMessage(
            "Contas registradas serão gerenciadas de forma simples e rápida.\n\nRelaxe!"),
        "onboardingControl": MessageLookupByLibrary.simpleMessage("Controle"),
        "onboardingControlText": MessageLookupByLibrary.simpleMessage(
            "Acompanhe seus gastos mensais.\nDo mês atual até 6 meses anteriores."),
        "onboardingLetsGo": MessageLookupByLibrary.simpleMessage("Vamos lá?"),
        "onboardingNotifications":
            MessageLookupByLibrary.simpleMessage("Notificações"),
        "onboardingNotificationsText": MessageLookupByLibrary.simpleMessage(
            "Vamos notificá-lo quando uma conta estiver perto de vencer."),
        "onboardingSaveTime":
            MessageLookupByLibrary.simpleMessage("Poupe seu tempo"),
        "onboardingSaveTimeText": MessageLookupByLibrary.simpleMessage(
            "Deixa de lado as preocupações com os vencimentos de suas contas e aproveite a vida."),
        "onboardingSkip": MessageLookupByLibrary.simpleMessage("Pular"),
        "onboardingStart": MessageLookupByLibrary.simpleMessage("Começar"),
        "onboardingStartNow":
            MessageLookupByLibrary.simpleMessage("Comece agora"),
        "onboardingWelcome": MessageLookupByLibrary.simpleMessage("Bem-vindo"),
        "onboardingWelcomeText": MessageLookupByLibrary.simpleMessage(
            "Só Boleto vai ser o seu assitente pessoal de contas daqui em diante, ok?\n\nDeixa com a gente."),
        "parcels": MessageLookupByLibrary.simpleMessage("Parcelas"),
        "payedTag": MessageLookupByLibrary.simpleMessage("PAGA"),
        "profile": MessageLookupByLibrary.simpleMessage("Perfil"),
        "profileAccess": MessageLookupByLibrary.simpleMessage(
            "Use sua senha para continuar"),
        "profileChangePassword":
            MessageLookupByLibrary.simpleMessage("Trocar senha"),
        "profileDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Deletar conta"),
        "profileDueDay": MessageLookupByLibrary.simpleMessage("Vencimento"),
        "profileDueDayPageChooseDueDay":
            MessageLookupByLibrary.simpleMessage("Escolha um vencimento"),
        "profileDueDayPageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Você ainda pode alterar essa data\nao criar ou editar uma conta."),
        "profileDueDayPageTitle": MessageLookupByLibrary.simpleMessage(
            "Ao selecionar um dia, todas as contas criadas terão automaticamente esse dia como vencimento."),
        "profileDueDayText": MessageLookupByLibrary.simpleMessage(
            "Dia preferido para suas contas vencerem"),
        "profileIncorrectPassword":
            MessageLookupByLibrary.simpleMessage("Senha incorreta"),
        "profileLogout": MessageLookupByLibrary.simpleMessage("Sair"),
        "profileManagement":
            MessageLookupByLibrary.simpleMessage("Gerenciamento"),
        "profileMyProfile": MessageLookupByLibrary.simpleMessage("Meu Perfil"),
        "profilePayedTagBottomBar":
            MessageLookupByLibrary.simpleMessage("Barra inferior"),
        "profilePayedTagCheck":
            MessageLookupByLibrary.simpleMessage("Check na borda"),
        "profilePayedTagExample":
            MessageLookupByLibrary.simpleMessage("Exemplo"),
        "profilePayedTagSideBar":
            MessageLookupByLibrary.simpleMessage("Barra lateral"),
        "profilePayedTagStaple":
            MessageLookupByLibrary.simpleMessage("Carimbo"),
        "profilePayedTagTitle": MessageLookupByLibrary.simpleMessage(
            "Selecione a tag de pagamento que melhor se adapte a você"),
        "profilePaymentTag":
            MessageLookupByLibrary.simpleMessage("Marca de pagamento"),
        "profilePaymentTagText": MessageLookupByLibrary.simpleMessage(
            "Escolha uma tag para as contas marcadas como pagas"),
        "profilePhoto": MessageLookupByLibrary.simpleMessage("Foto de perfil"),
        "profilePreferences":
            MessageLookupByLibrary.simpleMessage("Preferências"),
        "profileSecurity": MessageLookupByLibrary.simpleMessage("Segurança"),
        "profileSecurityOption":
            MessageLookupByLibrary.simpleMessage("Opções de segurança"),
        "profileSeeGallery": MessageLookupByLibrary.simpleMessage("Galeria"),
        "profileSeePicture": MessageLookupByLibrary.simpleMessage("Ver foto"),
        "profileTakePicture":
            MessageLookupByLibrary.simpleMessage("Tirar foto"),
        "profileTheme": MessageLookupByLibrary.simpleMessage("Tema"),
        "profileThemeDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "profileThemeLight": MessageLookupByLibrary.simpleMessage("Light"),
        "profileThemeText":
            MessageLookupByLibrary.simpleMessage("Temas e cores do seu app"),
        "profileThemeTitle":
            MessageLookupByLibrary.simpleMessage("Cor do tema"),
        "prompBillAppBar":
            MessageLookupByLibrary.simpleMessage("Contas prontas"),
        "prompBillAppBarRemoveAll":
            MessageLookupByLibrary.simpleMessage("Remover todas"),
        "prompBillAppBarSelectAll":
            MessageLookupByLibrary.simpleMessage("Selecionar todas"),
        "prompBillCollege": MessageLookupByLibrary.simpleMessage("Faculdade"),
        "prompBillCourse": MessageLookupByLibrary.simpleMessage("Curso"),
        "prompBillEditionAppBar":
            MessageLookupByLibrary.simpleMessage("Edição de contas prontas"),
        "prompBillEditionTileDueDay":
            MessageLookupByLibrary.simpleMessage(" Vencimento"),
        "prompBillEditionTileValue":
            MessageLookupByLibrary.simpleMessage(" Valor"),
        "prompBillHelthInsurance":
            MessageLookupByLibrary.simpleMessage("Plano de saúde"),
        "prompBillMedicine": MessageLookupByLibrary.simpleMessage("Remédios"),
        "prompBillSchool": MessageLookupByLibrary.simpleMessage("Escola"),
        "promptBillEditionTitle": MessageLookupByLibrary.simpleMessage(
            "Selecione um dia para o vencimento e um valor para as contas prontas selecionadas"),
        "promptBillTitle": MessageLookupByLibrary.simpleMessage(
            "Selecione as contas que você deseja adicionar à sua lista"),
        "responseHandlerError":
            MessageLookupByLibrary.simpleMessage("Ops!\nAlgo deu errado."),
        "responseHandlerNoMorePromptBills":
            MessageLookupByLibrary.simpleMessage(
                "Você já utilizou todas as contas prontas disponíveis."),
        "responseHandlerNoneDelayed": MessageLookupByLibrary.simpleMessage(
            "Você não tem contas atrasadas."),
        "responseHandlerNoneForTheseFilters":
            MessageLookupByLibrary.simpleMessage(
                "Nenhuma conta com esses filtros."),
        "responseHandlerNonePayed":
            MessageLookupByLibrary.simpleMessage("Você não tem contas pagas."),
        "responseHandlerNoneRegistered": MessageLookupByLibrary.simpleMessage(
            "Você não tem contas cadastradas."),
        "responseHandlerNoneWithThisName": MessageLookupByLibrary.simpleMessage(
            "Nenhuma conta com esse nome."),
        "signIn": MessageLookupByLibrary.simpleMessage("Entrar"),
        "signInTitle": MessageLookupByLibrary.simpleMessage("Entre"),
        "signUp": MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage("Cadastre-se"),
        "spacedPayedTag": MessageLookupByLibrary.simpleMessage("P A G A"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Tente novamente"),
        "validatorEmail":
            MessageLookupByLibrary.simpleMessage("Não é um email válido"),
        "yes": MessageLookupByLibrary.simpleMessage("Sim")
      };
}
