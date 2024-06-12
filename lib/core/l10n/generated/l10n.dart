// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Só`
  String get appNameHalf1 {
    return Intl.message(
      'Só',
      name: 'appNameHalf1',
      desc: '',
      args: [],
    );
  }

  /// `Boleto`
  String get appNameHalf2 {
    return Intl.message(
      'Boleto',
      name: 'appNameHalf2',
      desc: '',
      args: [],
    );
  }

  /// `Voltar`
  String get back {
    return Intl.message(
      'Voltar',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Sem conexão`
  String get errorNoConnectionPage {
    return Intl.message(
      'Sem conexão',
      name: 'errorNoConnectionPage',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get errorUnknowError {
    return Intl.message(
      'Tente novamente',
      name: 'errorUnknowError',
      desc: '',
      args: [],
    );
  }

  /// `Cadastrar`
  String get signIn {
    return Intl.message(
      'Cadastrar',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Nome da conta`
  String get billFlowName {
    return Intl.message(
      'Nome da conta',
      name: 'billFlowName',
      desc: '',
      args: [],
    );
  }

  /// `Nova conta`
  String get billFlowNewBill {
    return Intl.message(
      'Nova conta',
      name: 'billFlowNewBill',
      desc: '',
      args: [],
    );
  }

  /// `Descrição da conta`
  String get billFlowDescription {
    return Intl.message(
      'Descrição da conta',
      name: 'billFlowDescription',
      desc: '',
      args: [],
    );
  }

  /// `(Opcional)`
  String get billFlowOptional {
    return Intl.message(
      '(Opcional)',
      name: 'billFlowOptional',
      desc: '',
      args: [],
    );
  }

  /// `Essa é uma conta mensal fixa?`
  String get billFlowFixedSwitch {
    return Intl.message(
      'Essa é uma conta mensal fixa?',
      name: 'billFlowFixedSwitch',
      desc: '',
      args: [],
    );
  }

  /// `Ou uma conta mensal parcelada?`
  String get billFlowParceledSwitch {
    return Intl.message(
      'Ou uma conta mensal parcelada?',
      name: 'billFlowParceledSwitch',
      desc: '',
      args: [],
    );
  }

  /// `Quantas parcelas?`
  String get billFlowHowManyParcels {
    return Intl.message(
      'Quantas parcelas?',
      name: 'billFlowHowManyParcels',
      desc: '',
      args: [],
    );
  }

  /// `Valor da conta`
  String get billFlowValueTitle {
    return Intl.message(
      'Valor da conta',
      name: 'billFlowValueTitle',
      desc: '',
      args: [],
    );
  }

  /// `(Valor da parcela)`
  String get billFlowParcelValue {
    return Intl.message(
      '(Valor da parcela)',
      name: 'billFlowParcelValue',
      desc: '',
      args: [],
    );
  }

  /// `Dia do vencimento`
  String get billFlowDueDayTitle {
    return Intl.message(
      'Dia do vencimento',
      name: 'billFlowDueDayTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get billFlowCheckName {
    return Intl.message(
      'Name:',
      name: 'billFlowCheckName',
      desc: '',
      args: [],
    );
  }

  /// `Descrição:`
  String get billFlowCheckDescription {
    return Intl.message(
      'Descrição:',
      name: 'billFlowCheckDescription',
      desc: '',
      args: [],
    );
  }

  /// `Vencimento:`
  String get billFlowCheckDueDay {
    return Intl.message(
      'Vencimento:',
      name: 'billFlowCheckDueDay',
      desc: '',
      args: [],
    );
  }

  /// `Valor:`
  String get billFlowCheckValue {
    return Intl.message(
      'Valor:',
      name: 'billFlowCheckValue',
      desc: '',
      args: [],
    );
  }

  /// `Categoria`
  String get billFlowCheckCategory {
    return Intl.message(
      'Categoria',
      name: 'billFlowCheckCategory',
      desc: '',
      args: [],
    );
  }

  /// `Automóvel`
  String get categoryAutomobile {
    return Intl.message(
      'Automóvel',
      name: 'categoryAutomobile',
      desc: '',
      args: [],
    );
  }

  /// `Cartão de crédito`
  String get categoryCreditCard {
    return Intl.message(
      'Cartão de crédito',
      name: 'categoryCreditCard',
      desc: '',
      args: [],
    );
  }

  /// `Dívida`
  String get categoryDebt {
    return Intl.message(
      'Dívida',
      name: 'categoryDebt',
      desc: '',
      args: [],
    );
  }

  /// `Eletrônicos`
  String get categoryDevices {
    return Intl.message(
      'Eletrônicos',
      name: 'categoryDevices',
      desc: '',
      args: [],
    );
  }

  /// `Educação`
  String get categoryEducation {
    return Intl.message(
      'Educação',
      name: 'categoryEducation',
      desc: '',
      args: [],
    );
  }

  /// `Luz`
  String get categoryElectricity {
    return Intl.message(
      'Luz',
      name: 'categoryElectricity',
      desc: '',
      args: [],
    );
  }

  /// `Entretenimento`
  String get categoryEntertainment {
    return Intl.message(
      'Entretenimento',
      name: 'categoryEntertainment',
      desc: '',
      args: [],
    );
  }

  /// `Mercado`
  String get categoryGroceries {
    return Intl.message(
      'Mercado',
      name: 'categoryGroceries',
      desc: '',
      args: [],
    );
  }

  /// `Gás`
  String get categoryGas {
    return Intl.message(
      'Gás',
      name: 'categoryGas',
      desc: '',
      args: [],
    );
  }

  /// `Saúde`
  String get categoryHealthCare {
    return Intl.message(
      'Saúde',
      name: 'categoryHealthCare',
      desc: '',
      args: [],
    );
  }

  /// `Seguro`
  String get categoryInsurance {
    return Intl.message(
      'Seguro',
      name: 'categoryInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Investimento`
  String get categoryInvestment {
    return Intl.message(
      'Investimento',
      name: 'categoryInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Internet`
  String get categoryInternet {
    return Intl.message(
      'Internet',
      name: 'categoryInternet',
      desc: '',
      args: [],
    );
  }

  /// `Diversos`
  String get categoryMiscellaneous {
    return Intl.message(
      'Diversos',
      name: 'categoryMiscellaneous',
      desc: '',
      args: [],
    );
  }

  /// `Aluguel`
  String get categoryRent {
    return Intl.message(
      'Aluguel',
      name: 'categoryRent',
      desc: '',
      args: [],
    );
  }

  /// `Pet shop`
  String get categorypetShop {
    return Intl.message(
      'Pet shop',
      name: 'categorypetShop',
      desc: '',
      args: [],
    );
  }

  /// `telefone`
  String get categoryTelephone {
    return Intl.message(
      'telefone',
      name: 'categoryTelephone',
      desc: '',
      args: [],
    );
  }

  /// `Transporte`
  String get categoryTransportation {
    return Intl.message(
      'Transporte',
      name: 'categoryTransportation',
      desc: '',
      args: [],
    );
  }

  /// `Viagem`
  String get categoryTravel {
    return Intl.message(
      'Viagem',
      name: 'categoryTravel',
      desc: '',
      args: [],
    );
  }

  /// `Água`
  String get categoryWater {
    return Intl.message(
      'Água',
      name: 'categoryWater',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get continueButton {
    return Intl.message(
      'Continuar',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Encerrar`
  String get close {
    return Intl.message(
      'Encerrar',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Pronto`
  String get done {
    return Intl.message(
      'Pronto',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `dia`
  String get dueDayExtensionsDay {
    return Intl.message(
      'dia',
      name: 'dueDayExtensionsDay',
      desc: '',
      args: [],
    );
  }

  /// `dias`
  String get dueDayExtensionsDays {
    return Intl.message(
      'dias',
      name: 'dueDayExtensionsDays',
      desc: '',
      args: [],
    );
  }

  /// `Vence hoje`
  String get dueDayExtensionsDueToday {
    return Intl.message(
      'Vence hoje',
      name: 'dueDayExtensionsDueToday',
      desc: '',
      args: [],
    );
  }

  /// `Vence em`
  String get dueDayExtensionsDueIn {
    return Intl.message(
      'Vence em',
      name: 'dueDayExtensionsDueIn',
      desc: '',
      args: [],
    );
  }

  /// `Vencida há`
  String get dueDayExtensionsDelayedSince {
    return Intl.message(
      'Vencida há',
      name: 'dueDayExtensionsDelayedSince',
      desc: '',
      args: [],
    );
  }

  /// `Gastos`
  String get expenses {
    return Intl.message(
      'Gastos',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `Gastos deste mês`
  String get expensesForThisMonth {
    return Intl.message(
      'Gastos deste mês',
      name: 'expensesForThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Gastos dos últimos 3 meses`
  String get expensesForThreeMonth {
    return Intl.message(
      'Gastos dos últimos 3 meses',
      name: 'expensesForThreeMonth',
      desc: '',
      args: [],
    );
  }

  /// `Gastos dos últimos 6 meses`
  String get expensesForSixMonth {
    return Intl.message(
      'Gastos dos últimos 6 meses',
      name: 'expensesForSixMonth',
      desc: '',
      args: [],
    );
  }

  /// `Filtros`
  String get filter {
    return Intl.message(
      'Filtros',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Por categoria`
  String get filterByCategory {
    return Intl.message(
      'Por categoria',
      name: 'filterByCategory',
      desc: '',
      args: [],
    );
  }

  /// `Vencimento`
  String get filterDueDay {
    return Intl.message(
      'Vencimento',
      name: 'filterDueDay',
      desc: '',
      args: [],
    );
  }

  /// `Valor`
  String get filterValue {
    return Intl.message(
      'Valor',
      name: 'filterValue',
      desc: '',
      args: [],
    );
  }

  /// `Aplicar`
  String get filterApply {
    return Intl.message(
      'Aplicar',
      name: 'filterApply',
      desc: '',
      args: [],
    );
  }

  /// `Ver filtros`
  String get filterSee {
    return Intl.message(
      'Ver filtros',
      name: 'filterSee',
      desc: '',
      args: [],
    );
  }

  /// `Remover filtros`
  String get filterRemove {
    return Intl.message(
      'Remover filtros',
      name: 'filterRemove',
      desc: '',
      args: [],
    );
  }

  /// `Conta fixa`
  String get formatterMonthBill {
    return Intl.message(
      'Conta fixa',
      name: 'formatterMonthBill',
      desc: '',
      args: [],
    );
  }

  /// `Mensal fixa`
  String get formatterMonth {
    return Intl.message(
      'Mensal fixa',
      name: 'formatterMonth',
      desc: '',
      args: [],
    );
  }

  /// `{parcelNumber} parcelas`
  String formatterParcelsTimes(int parcelNumber) {
    return Intl.message(
      '$parcelNumber parcelas',
      name: 'formatterParcelsTimes',
      desc: '',
      args: [parcelNumber],
    );
  }

  /// `{payedParcels} de {parcels}`
  String formatterPayedParcelsOfParcels(int payedParcels, int parcels) {
    return Intl.message(
      '$payedParcels de $parcels',
      name: 'formatterPayedParcelsOfParcels',
      desc: '',
      args: [payedParcels, parcels],
    );
  }

  /// `mais de {parcelNumber}`
  String formatterParcelsMoreThan(String parcelNumber) {
    return Intl.message(
      'mais de $parcelNumber',
      name: 'formatterParcelsMoreThan',
      desc: '',
      args: [parcelNumber],
    );
  }

  /// `{parcelNumber} ou menos`
  String formatterParcelsOrLess(String parcelNumber) {
    return Intl.message(
      '$parcelNumber ou menos',
      name: 'formatterParcelsOrLess',
      desc: '',
      args: [parcelNumber],
    );
  }

  /// `de {fisrtRange} a {lastRange}`
  String formatterParcelsFromTo(int fisrtRange, int lastRange) {
    return Intl.message(
      'de $fisrtRange a $lastRange',
      name: 'formatterParcelsFromTo',
      desc: '',
      args: [fisrtRange, lastRange],
    );
  }

  /// `depois do dia {range}`
  String formatterDayAfter(int range) {
    return Intl.message(
      'depois do dia $range',
      name: 'formatterDayAfter',
      desc: '',
      args: [range],
    );
  }

  /// `antes do dia {range}`
  String formatterDayBefore(int range) {
    return Intl.message(
      'antes do dia $range',
      name: 'formatterDayBefore',
      desc: '',
      args: [range],
    );
  }

  /// `entre os dias {range1} e {range2}`
  String formatterDayBetween(int range1, int range2) {
    return Intl.message(
      'entre os dias $range1 e $range2',
      name: 'formatterDayBetween',
      desc: '',
      args: [range1, range2],
    );
  }

  /// `Suas contas`
  String get homeAppBarTitle {
    return Intl.message(
      'Suas contas',
      name: 'homeAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar conta nova`
  String get homeAppBarAddNewBill {
    return Intl.message(
      'Adicionar conta nova',
      name: 'homeAppBarAddNewBill',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar contas prontas`
  String get homeAppBarAddPromptBills {
    return Intl.message(
      'Adicionar contas prontas',
      name: 'homeAppBarAddPromptBills',
      desc: '',
      args: [],
    );
  }

  /// `Paga`
  String get homeBillPayedTag {
    return Intl.message(
      'Paga',
      name: 'homeBillPayedTag',
      desc: '',
      args: [],
    );
  }

  /// `Pagando...`
  String get homeBillPaying {
    return Intl.message(
      'Pagando...',
      name: 'homeBillPaying',
      desc: '',
      args: [],
    );
  }

  /// `Deletando...`
  String get homeBillDeleting {
    return Intl.message(
      'Deletando...',
      name: 'homeBillDeleting',
      desc: '',
      args: [],
    );
  }

  /// `Todas`
  String get homeTabAll {
    return Intl.message(
      'Todas',
      name: 'homeTabAll',
      desc: '',
      args: [],
    );
  }

  /// `Pagas`
  String get homeTabPayed {
    return Intl.message(
      'Pagas',
      name: 'homeTabPayed',
      desc: '',
      args: [],
    );
  }

  /// `Atrasadas`
  String get homeTabDelayed {
    return Intl.message(
      'Atrasadas',
      name: 'homeTabDelayed',
      desc: '',
      args: [],
    );
  }

  /// `Parcelas`
  String get parcels {
    return Intl.message(
      'Parcelas',
      name: 'parcels',
      desc: '',
      args: [],
    );
  }

  /// `Contas prontas`
  String get prompBillAppBar {
    return Intl.message(
      'Contas prontas',
      name: 'prompBillAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Edição de contas prontas`
  String get prompBillEditionAppBar {
    return Intl.message(
      'Edição de contas prontas',
      name: 'prompBillEditionAppBar',
      desc: '',
      args: [],
    );
  }

  /// ` Vencimento`
  String get prompBillEditionTileDueDay {
    return Intl.message(
      ' Vencimento',
      name: 'prompBillEditionTileDueDay',
      desc: '',
      args: [],
    );
  }

  /// ` Valor`
  String get prompBillEditionTileValue {
    return Intl.message(
      ' Valor',
      name: 'prompBillEditionTileValue',
      desc: '',
      args: [],
    );
  }

  /// `Remover todas`
  String get prompBillAppBarRemoveAll {
    return Intl.message(
      'Remover todas',
      name: 'prompBillAppBarRemoveAll',
      desc: '',
      args: [],
    );
  }

  /// `Selecionar todas`
  String get prompBillAppBarSelectAll {
    return Intl.message(
      'Selecionar todas',
      name: 'prompBillAppBarSelectAll',
      desc: '',
      args: [],
    );
  }

  /// `Faculdade`
  String get prompBillCollege {
    return Intl.message(
      'Faculdade',
      name: 'prompBillCollege',
      desc: '',
      args: [],
    );
  }

  /// `Curso`
  String get prompBillCourse {
    return Intl.message(
      'Curso',
      name: 'prompBillCourse',
      desc: '',
      args: [],
    );
  }

  /// `Remédios`
  String get prompBillMedicine {
    return Intl.message(
      'Remédios',
      name: 'prompBillMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Plano de saúde`
  String get prompBillHelthInsurance {
    return Intl.message(
      'Plano de saúde',
      name: 'prompBillHelthInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Escola`
  String get prompBillSchool {
    return Intl.message(
      'Escola',
      name: 'prompBillSchool',
      desc: '',
      args: [],
    );
  }

  /// `Selecione as contas que você deseja adicionar à sua lista`
  String get promptBillTitle {
    return Intl.message(
      'Selecione as contas que você deseja adicionar à sua lista',
      name: 'promptBillTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selecione um dia para o vencimento e um valor para as contas prontas selecionadas`
  String get promptBillEditionTitle {
    return Intl.message(
      'Selecione um dia para o vencimento e um valor para as contas prontas selecionadas',
      name: 'promptBillEditionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ops!\nAlgo deu errado.`
  String get responseHandlerError {
    return Intl.message(
      'Ops!\nAlgo deu errado.',
      name: 'responseHandlerError',
      desc: '',
      args: [],
    );
  }

  /// `Você já utilizou todas as contas prontas disponíveis.`
  String get responseHandlerNoMorePromptBills {
    return Intl.message(
      'Você já utilizou todas as contas prontas disponíveis.',
      name: 'responseHandlerNoMorePromptBills',
      desc: '',
      args: [],
    );
  }

  /// `Você não tem contas cadastradas.`
  String get responseHandlerNoneRegistered {
    return Intl.message(
      'Você não tem contas cadastradas.',
      name: 'responseHandlerNoneRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Você não tem contas atrasadas.`
  String get responseHandlerNoneDelayed {
    return Intl.message(
      'Você não tem contas atrasadas.',
      name: 'responseHandlerNoneDelayed',
      desc: '',
      args: [],
    );
  }

  /// `Nenhuma conta com esses filtros.`
  String get responseHandlerNoneForTheseFilters {
    return Intl.message(
      'Nenhuma conta com esses filtros.',
      name: 'responseHandlerNoneForTheseFilters',
      desc: '',
      args: [],
    );
  }

  /// `Você não tem contas pagas.'`
  String get responseHandlerNonePayed {
    return Intl.message(
      'Você não tem contas pagas.\'',
      name: 'responseHandlerNonePayed',
      desc: '',
      args: [],
    );
  }

  /// `Nenhuma conta com esse nome.`
  String get responseHandlerNoneWithThisName {
    return Intl.message(
      'Nenhuma conta com esse nome.',
      name: 'responseHandlerNoneWithThisName',
      desc: '',
      args: [],
    );
  }

  /// `Tente novamente`
  String get tryAgain {
    return Intl.message(
      'Tente novamente',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Não é um email válido`
  String get validatorEmail {
    return Intl.message(
      'Não é um email válido',
      name: 'validatorEmail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
