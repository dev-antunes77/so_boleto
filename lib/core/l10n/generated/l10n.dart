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

  /// `Erro`
  String get error {
    return Intl.message(
      'Erro',
      name: 'error',
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

  /// `Edição da conta`
  String get billFlowBillEdition {
    return Intl.message(
      'Edição da conta',
      name: 'billFlowBillEdition',
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

  /// `Remover das contas pagas`
  String get billFlowRemoveFromPayed {
    return Intl.message(
      'Remover das contas pagas',
      name: 'billFlowRemoveFromPayed',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar às contas pagas`
  String get billFlowAddToPayed {
    return Intl.message(
      'Adicionar às contas pagas',
      name: 'billFlowAddToPayed',
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

  /// `Veículo`
  String get categoryAutomobile {
    return Intl.message(
      'Veículo',
      name: 'categoryAutomobile',
      desc: '',
      args: [],
    );
  }

  /// `Carro`
  String get categoryAutomobileCar {
    return Intl.message(
      'Carro',
      name: 'categoryAutomobileCar',
      desc: '',
      args: [],
    );
  }

  /// `Moto`
  String get categoryAutomobileMotorcycle {
    return Intl.message(
      'Moto',
      name: 'categoryAutomobileMotorcycle',
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

  /// `Vestimenta`
  String get categoryClothes {
    return Intl.message(
      'Vestimenta',
      name: 'categoryClothes',
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

  /// `Manutenção`
  String get categoryMaintenance {
    return Intl.message(
      'Manutenção',
      name: 'categoryMaintenance',
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

  /// `Telefone`
  String get categoryTelephone {
    return Intl.message(
      'Telefone',
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

  /// `Confirmar`
  String get confirm {
    return Intl.message(
      'Confirmar',
      name: 'confirm',
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

  /// `Pular boas vindas?`
  String get dialogOnboardingSkip {
    return Intl.message(
      'Pular boas vindas?',
      name: 'dialogOnboardingSkip',
      desc: '',
      args: [],
    );
  }

  /// `Tem certeza que deseja pular a tela de boas vindas?`
  String get dialogOnboardingSkipText {
    return Intl.message(
      'Tem certeza que deseja pular a tela de boas vindas?',
      name: 'dialogOnboardingSkipText',
      desc: '',
      args: [],
    );
  }

  /// `Sair?`
  String get dialogProfileLogout {
    return Intl.message(
      'Sair?',
      name: 'dialogProfileLogout',
      desc: '',
      args: [],
    );
  }

  /// `Tem certeza que deseja deslogar deslogar, {user}`
  String dialogProfileLogoutText(String user) {
    return Intl.message(
      'Tem certeza que deseja deslogar deslogar, $user',
      name: 'dialogProfileLogoutText',
      desc: '',
      args: [user],
    );
  }

  /// `Tem certeza?`
  String get dialogBillFlowLeaveBill {
    return Intl.message(
      'Tem certeza?',
      name: 'dialogBillFlowLeaveBill',
      desc: '',
      args: [],
    );
  }

  /// `Se sair,\na criação dessa conta será perdida.`
  String get dialogBillFlowLeaveBillText {
    return Intl.message(
      'Se sair,\na criação dessa conta será perdida.',
      name: 'dialogBillFlowLeaveBillText',
      desc: '',
      args: [],
    );
  }

  /// `Sair do app?`
  String get dialogLeaveApp {
    return Intl.message(
      'Sair do app?',
      name: 'dialogLeaveApp',
      desc: '',
      args: [],
    );
  }

  /// `Tem certeza que deseja\nsair do app?`
  String get dialogLeaveAppText {
    return Intl.message(
      'Tem certeza que deseja\nsair do app?',
      name: 'dialogLeaveAppText',
      desc: '',
      args: [],
    );
  }

  /// `Deseja mesmo deletar essa conta?`
  String get dialogDeleteBill {
    return Intl.message(
      'Deseja mesmo deletar essa conta?',
      name: 'dialogDeleteBill',
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

  /// `Ordenar`
  String get homeAppBarOrder {
    return Intl.message(
      'Ordenar',
      name: 'homeAppBarOrder',
      desc: '',
      args: [],
    );
  }

  /// `Por nome`
  String get homeAppBarOrderByName {
    return Intl.message(
      'Por nome',
      name: 'homeAppBarOrderByName',
      desc: '',
      args: [],
    );
  }

  /// `Por vencimento`
  String get homeAppBarOrderByDueDay {
    return Intl.message(
      'Por vencimento',
      name: 'homeAppBarOrderByDueDay',
      desc: '',
      args: [],
    );
  }

  /// `Por valor`
  String get homeAppBarOrderByValue {
    return Intl.message(
      'Por valor',
      name: 'homeAppBarOrderByValue',
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

  /// `Ops! Não foi possível realizar essa ação.`
  String get homeBillActionError {
    return Intl.message(
      'Ops! Não foi possível realizar essa ação.',
      name: 'homeBillActionError',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao criar a conta`
  String get homeBillCreationError {
    return Intl.message(
      'Erro ao criar a conta',
      name: 'homeBillCreationError',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao editar a conta`
  String get homeBillEditionError {
    return Intl.message(
      'Erro ao editar a conta',
      name: 'homeBillEditionError',
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

  /// `Futuras`
  String get homeTabFutureBills {
    return Intl.message(
      'Futuras',
      name: 'homeTabFutureBills',
      desc: '',
      args: [],
    );
  }

  /// `Nome`
  String get loginName {
    return Intl.message(
      'Nome',
      name: 'loginName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginEmail {
    return Intl.message(
      'Email',
      name: 'loginEmail',
      desc: '',
      args: [],
    );
  }

  /// `Senha`
  String get loginPassword {
    return Intl.message(
      'Senha',
      name: 'loginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sobrenome`
  String get loginSurename {
    return Intl.message(
      'Sobrenome',
      name: 'loginSurename',
      desc: '',
      args: [],
    );
  }

  /// `Já possui conta?  `
  String get loginHasAccountAlready {
    return Intl.message(
      'Já possui conta?  ',
      name: 'loginHasAccountAlready',
      desc: '',
      args: [],
    );
  }

  /// `Ainda não tem conta? Cadastre-se  `
  String get loginNoAccount {
    return Intl.message(
      'Ainda não tem conta? Cadastre-se  ',
      name: 'loginNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Aqui`
  String get loginHere {
    return Intl.message(
      'Aqui',
      name: 'loginHere',
      desc: '',
      args: [],
    );
  }

  /// `Janeiro`
  String get monthJanuary {
    return Intl.message(
      'Janeiro',
      name: 'monthJanuary',
      desc: '',
      args: [],
    );
  }

  /// `Fevereiro`
  String get monthFebruary {
    return Intl.message(
      'Fevereiro',
      name: 'monthFebruary',
      desc: '',
      args: [],
    );
  }

  /// `Março`
  String get monthMarch {
    return Intl.message(
      'Março',
      name: 'monthMarch',
      desc: '',
      args: [],
    );
  }

  /// `Abril`
  String get monthApril {
    return Intl.message(
      'Abril',
      name: 'monthApril',
      desc: '',
      args: [],
    );
  }

  /// `Maio`
  String get monthMay {
    return Intl.message(
      'Maio',
      name: 'monthMay',
      desc: '',
      args: [],
    );
  }

  /// `Junho`
  String get monthJune {
    return Intl.message(
      'Junho',
      name: 'monthJune',
      desc: '',
      args: [],
    );
  }

  /// `Julho`
  String get monthJuly {
    return Intl.message(
      'Julho',
      name: 'monthJuly',
      desc: '',
      args: [],
    );
  }

  /// `Agosto`
  String get monthAugust {
    return Intl.message(
      'Agosto',
      name: 'monthAugust',
      desc: '',
      args: [],
    );
  }

  /// `Setembro`
  String get monthSeptember {
    return Intl.message(
      'Setembro',
      name: 'monthSeptember',
      desc: '',
      args: [],
    );
  }

  /// `Outubro`
  String get monthOctober {
    return Intl.message(
      'Outubro',
      name: 'monthOctober',
      desc: '',
      args: [],
    );
  }

  /// `Novembro`
  String get monthNovember {
    return Intl.message(
      'Novembro',
      name: 'monthNovember',
      desc: '',
      args: [],
    );
  }

  /// `Dezembro`
  String get monthDecember {
    return Intl.message(
      'Dezembro',
      name: 'monthDecember',
      desc: '',
      args: [],
    );
  }

  /// `Não`
  String get no {
    return Intl.message(
      'Não',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Pular`
  String get onboardingSkip {
    return Intl.message(
      'Pular',
      name: 'onboardingSkip',
      desc: '',
      args: [],
    );
  }

  /// `Bem-vindo`
  String get onboardingWelcome {
    return Intl.message(
      'Bem-vindo',
      name: 'onboardingWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Só Boleto vai ser o seu assitente pessoal de contas daqui em diante, ok?\n\nDeixa com a gente.`
  String get onboardingWelcomeText {
    return Intl.message(
      'Só Boleto vai ser o seu assitente pessoal de contas daqui em diante, ok?\n\nDeixa com a gente.',
      name: 'onboardingWelcomeText',
      desc: '',
      args: [],
    );
  }

  /// `Agilidade`
  String get onboardingAgility {
    return Intl.message(
      'Agilidade',
      name: 'onboardingAgility',
      desc: '',
      args: [],
    );
  }

  /// `Contas registradas serão gerenciadas de forma simples e rápida.\n\nRelaxe!`
  String get onboardingAgilityText {
    return Intl.message(
      'Contas registradas serão gerenciadas de forma simples e rápida.\n\nRelaxe!',
      name: 'onboardingAgilityText',
      desc: '',
      args: [],
    );
  }

  /// `Notificações`
  String get onboardingNotifications {
    return Intl.message(
      'Notificações',
      name: 'onboardingNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Vamos notificá-lo quando uma conta estiver perto de vencer.`
  String get onboardingNotificationsText {
    return Intl.message(
      'Vamos notificá-lo quando uma conta estiver perto de vencer.',
      name: 'onboardingNotificationsText',
      desc: '',
      args: [],
    );
  }

  /// `Controle`
  String get onboardingControl {
    return Intl.message(
      'Controle',
      name: 'onboardingControl',
      desc: '',
      args: [],
    );
  }

  /// `Acompanhe seus gastos mensais.\nDo mês atual até 6 meses anteriores.`
  String get onboardingControlText {
    return Intl.message(
      'Acompanhe seus gastos mensais.\nDo mês atual até 6 meses anteriores.',
      name: 'onboardingControlText',
      desc: '',
      args: [],
    );
  }

  /// `Poupe seu tempo`
  String get onboardingSaveTime {
    return Intl.message(
      'Poupe seu tempo',
      name: 'onboardingSaveTime',
      desc: '',
      args: [],
    );
  }

  /// `Deixa de lado as preocupações com os vencimentos de suas contas e aproveite a vida.`
  String get onboardingSaveTimeText {
    return Intl.message(
      'Deixa de lado as preocupações com os vencimentos de suas contas e aproveite a vida.',
      name: 'onboardingSaveTimeText',
      desc: '',
      args: [],
    );
  }

  /// `Comece agora`
  String get onboardingStartNow {
    return Intl.message(
      'Comece agora',
      name: 'onboardingStartNow',
      desc: '',
      args: [],
    );
  }

  /// `Vamos lá?`
  String get onboardingLetsGo {
    return Intl.message(
      'Vamos lá?',
      name: 'onboardingLetsGo',
      desc: '',
      args: [],
    );
  }

  /// `Começar`
  String get onboardingStart {
    return Intl.message(
      'Começar',
      name: 'onboardingStart',
      desc: '',
      args: [],
    );
  }

  /// `PAGA`
  String get payedTag {
    return Intl.message(
      'PAGA',
      name: 'payedTag',
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

  /// `Perfil`
  String get profile {
    return Intl.message(
      'Perfil',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Ver foto`
  String get profileSeePicture {
    return Intl.message(
      'Ver foto',
      name: 'profileSeePicture',
      desc: '',
      args: [],
    );
  }

  /// `Tirar foto`
  String get profileTakePicture {
    return Intl.message(
      'Tirar foto',
      name: 'profileTakePicture',
      desc: '',
      args: [],
    );
  }

  /// `Galeria`
  String get profileSeeGallery {
    return Intl.message(
      'Galeria',
      name: 'profileSeeGallery',
      desc: '',
      args: [],
    );
  }

  /// `Preferências`
  String get profilePreferences {
    return Intl.message(
      'Preferências',
      name: 'profilePreferences',
      desc: '',
      args: [],
    );
  }

  /// `Tema`
  String get profileTheme {
    return Intl.message(
      'Tema',
      name: 'profileTheme',
      desc: '',
      args: [],
    );
  }

  /// `Temas e cores do seu app`
  String get profileThemeText {
    return Intl.message(
      'Temas e cores do seu app',
      name: 'profileThemeText',
      desc: '',
      args: [],
    );
  }

  /// `Vencimento`
  String get profileDueDay {
    return Intl.message(
      'Vencimento',
      name: 'profileDueDay',
      desc: '',
      args: [],
    );
  }

  /// `Dia preferido para suas contas vencerem`
  String get profileDueDayText {
    return Intl.message(
      'Dia preferido para suas contas vencerem',
      name: 'profileDueDayText',
      desc: '',
      args: [],
    );
  }

  /// `Marca de pagamento`
  String get profilePaymentTag {
    return Intl.message(
      'Marca de pagamento',
      name: 'profilePaymentTag',
      desc: '',
      args: [],
    );
  }

  /// `Escolha uma tag para as contas marcadas como pagas`
  String get profilePaymentTagText {
    return Intl.message(
      'Escolha uma tag para as contas marcadas como pagas',
      name: 'profilePaymentTagText',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento`
  String get profileManagement {
    return Intl.message(
      'Gerenciamento',
      name: 'profileManagement',
      desc: '',
      args: [],
    );
  }

  /// `Segurança`
  String get profileSecurity {
    return Intl.message(
      'Segurança',
      name: 'profileSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Sair`
  String get profileLogout {
    return Intl.message(
      'Sair',
      name: 'profileLogout',
      desc: '',
      args: [],
    );
  }

  /// `Escolha um vencimento`
  String get profileDueDayPageChooseDueDay {
    return Intl.message(
      'Escolha um vencimento',
      name: 'profileDueDayPageChooseDueDay',
      desc: '',
      args: [],
    );
  }

  /// `Ao selecionar um dia, todas as contas criadas terão automaticamente esse dia como vencimento.`
  String get profileDueDayPageTitle {
    return Intl.message(
      'Ao selecionar um dia, todas as contas criadas terão automaticamente esse dia como vencimento.',
      name: 'profileDueDayPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Você ainda pode alterar essa data\nao criar ou editar uma conta.`
  String get profileDueDayPageSubtitle {
    return Intl.message(
      'Você ainda pode alterar essa data\nao criar ou editar uma conta.',
      name: 'profileDueDayPageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Use sua senha para continuar`
  String get profileAccess {
    return Intl.message(
      'Use sua senha para continuar',
      name: 'profileAccess',
      desc: '',
      args: [],
    );
  }

  /// `Opções de segurança`
  String get profileSecurityOption {
    return Intl.message(
      'Opções de segurança',
      name: 'profileSecurityOption',
      desc: '',
      args: [],
    );
  }

  /// `Trocar senha`
  String get profileChangePassword {
    return Intl.message(
      'Trocar senha',
      name: 'profileChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Deletar conta`
  String get profileDeleteAccount {
    return Intl.message(
      'Deletar conta',
      name: 'profileDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Senha incorreta`
  String get profileIncorrectPassword {
    return Intl.message(
      'Senha incorreta',
      name: 'profileIncorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Exemplo`
  String get profilePayedTagExample {
    return Intl.message(
      'Exemplo',
      name: 'profilePayedTagExample',
      desc: '',
      args: [],
    );
  }

  /// `Carimbo`
  String get profilePayedTagStaple {
    return Intl.message(
      'Carimbo',
      name: 'profilePayedTagStaple',
      desc: '',
      args: [],
    );
  }

  /// `Check na borda`
  String get profilePayedTagCheck {
    return Intl.message(
      'Check na borda',
      name: 'profilePayedTagCheck',
      desc: '',
      args: [],
    );
  }

  /// `Barra lateral`
  String get profilePayedTagSideBar {
    return Intl.message(
      'Barra lateral',
      name: 'profilePayedTagSideBar',
      desc: '',
      args: [],
    );
  }

  /// `Barra inferior`
  String get profilePayedTagBottomBar {
    return Intl.message(
      'Barra inferior',
      name: 'profilePayedTagBottomBar',
      desc: '',
      args: [],
    );
  }

  /// `Selecione a tag de pagamento que melhor se adapte a você`
  String get profilePayedTagTitle {
    return Intl.message(
      'Selecione a tag de pagamento que melhor se adapte a você',
      name: 'profilePayedTagTitle',
      desc: '',
      args: [],
    );
  }

  /// `Foto de perfil`
  String get profilePhoto {
    return Intl.message(
      'Foto de perfil',
      name: 'profilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Meu Perfil`
  String get profileMyProfile {
    return Intl.message(
      'Meu Perfil',
      name: 'profileMyProfile',
      desc: '',
      args: [],
    );
  }

  /// `Cor do tema`
  String get profileThemeTitle {
    return Intl.message(
      'Cor do tema',
      name: 'profileThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get profileThemeDark {
    return Intl.message(
      'Dark',
      name: 'profileThemeDark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get profileThemeLight {
    return Intl.message(
      'Light',
      name: 'profileThemeLight',
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

  /// `Reparos`
  String get prompBillRepairs {
    return Intl.message(
      'Reparos',
      name: 'prompBillRepairs',
      desc: '',
      args: [],
    );
  }

  /// `Manutenção`
  String get prompBillMaintenance {
    return Intl.message(
      'Manutenção',
      name: 'prompBillMaintenance',
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

  /// `Você não tem contas parceladas para frente.`
  String get responseHandlerNoneFutureBills {
    return Intl.message(
      'Você não tem contas parceladas para frente.',
      name: 'responseHandlerNoneFutureBills',
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

  /// `Você não tem contas pagas.`
  String get responseHandlerNonePayed {
    return Intl.message(
      'Você não tem contas pagas.',
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

  /// `P A G A`
  String get spacedPayedTag {
    return Intl.message(
      'P A G A',
      name: 'spacedPayedTag',
      desc: '',
      args: [],
    );
  }

  /// `Cadastrar`
  String get signUp {
    return Intl.message(
      'Cadastrar',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Cadastre-se`
  String get signUpTitle {
    return Intl.message(
      'Cadastre-se',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get signIn {
    return Intl.message(
      'Entrar',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Entre`
  String get signInTitle {
    return Intl.message(
      'Entre',
      name: 'signInTitle',
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

  /// `Sim`
  String get yes {
    return Intl.message(
      'Sim',
      name: 'yes',
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
