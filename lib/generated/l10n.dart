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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Головний екран`
  String get mainPage {
    return Intl.message(
      'Головний екран',
      name: 'mainPage',
      desc: '',
      args: [],
    );
  }

  /// `Стандартні функції`
  String get standardFunctions {
    return Intl.message(
      'Стандартні функції',
      name: 'standardFunctions',
      desc: '',
      args: [],
    );
  }

  /// `Перелік елементів, форми, вікна повідомлень, та iнше`
  String get listOfElements {
    return Intl.message(
      'Перелік елементів, форми, вікна повідомлень, та iнше',
      name: 'listOfElements',
      desc: '',
      args: [],
    );
  }

  /// `Сторонні сервіси`
  String get thirdPartyServices {
    return Intl.message(
      'Сторонні сервіси',
      name: 'thirdPartyServices',
      desc: '',
      args: [],
    );
  }

  /// `Екран інтеграції сторонніх сервісів (Стандартна авторизація, Google, Apple ID, Stripe, Google Maps, Mapbox)`
  String get thirdpartyServicesIntegrationScreen {
    return Intl.message(
      'Екран інтеграції сторонніх сервісів (Стандартна авторизація, Google, Apple ID, Stripe, Google Maps, Mapbox)',
      name: 'thirdpartyServicesIntegrationScreen',
      desc: '',
      args: [],
    );
  }

  /// `Робота з базою даних`
  String get workingWithTheDatabase {
    return Intl.message(
      'Робота з базою даних',
      name: 'workingWithTheDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Приклад створення переліку задач`
  String get exampleOfCreatingAListOfTasks {
    return Intl.message(
      'Приклад створення переліку задач',
      name: 'exampleOfCreatingAListOfTasks',
      desc: '',
      args: [],
    );
  }

  /// `Використання датчиків`
  String get useOfSensors {
    return Intl.message(
      'Використання датчиків',
      name: 'useOfSensors',
      desc: '',
      args: [],
    );
  }

  /// `Приклад використання датчиків`
  String get exampleOfUseOfSensors {
    return Intl.message(
      'Приклад використання датчиків',
      name: 'exampleOfUseOfSensors',
      desc: '',
      args: [],
    );
  }

  /// `Автаризація`
  String get authorization {
    return Intl.message(
      'Автаризація',
      name: 'authorization',
      desc: '',
      args: [],
    );
  }

  /// `Авторизація через емейл, через Google або Apple ID`
  String get registrationauthorizationViaEmailViaGoogleOrAppleId {
    return Intl.message(
      'Авторизація через емейл, через Google або Apple ID',
      name: 'registrationauthorizationViaEmailViaGoogleOrAppleId',
      desc: '',
      args: [],
    );
  }

  /// `Банківскі сервіси`
  String get bankingServices {
    return Intl.message(
      'Банківскі сервіси',
      name: 'bankingServices',
      desc: '',
      args: [],
    );
  }

  /// `Інтеграція Stripe: банківські карти, Google Pay та Apple Pay`
  String get stripeIntegrationBankCardsGooglePayAndApplePay {
    return Intl.message(
      'Інтеграція Stripe: банківські карти, Google Pay та Apple Pay',
      name: 'stripeIntegrationBankCardsGooglePayAndApplePay',
      desc: '',
      args: [],
    );
  }

  /// `Картографічні сервіси`
  String get mapServices {
    return Intl.message(
      'Картографічні сервіси',
      name: 'mapServices',
      desc: '',
      args: [],
    );
  }

  /// `Інтеграція на прикладі Google Maps та Mapbox з використанням датчика GPS`
  String get integrationUsingTheExampleOfGoogleMapsAndMapboxUsing {
    return Intl.message(
      'Інтеграція на прикладі Google Maps та Mapbox з використанням датчика GPS',
      name: 'integrationUsingTheExampleOfGoogleMapsAndMapboxUsing',
      desc: '',
      args: [],
    );
  }

  /// `Прості елементи`
  String get simpleElements {
    return Intl.message(
      'Прості елементи',
      name: 'simpleElements',
      desc: '',
      args: [],
    );
  }

  /// `Чекбокси, радіобаттони, кнопки, датапікери та інше`
  String get checkboxesRadioButtonsButtonsDatapickersAndOthers {
    return Intl.message(
      'Чекбокси, радіобаттони, кнопки, датапікери та інше',
      name: 'checkboxesRadioButtonsButtonsDatapickersAndOthers',
      desc: '',
      args: [],
    );
  }

  /// `Форми`
  String get forms {
    return Intl.message(
      'Форми',
      name: 'forms',
      desc: '',
      args: [],
    );
  }

  /// `Приклади форм з валідацією та без`
  String get examplesOfFormsWithAndWithoutValidation {
    return Intl.message(
      'Приклади форм з валідацією та без',
      name: 'examplesOfFormsWithAndWithoutValidation',
      desc: '',
      args: [],
    );
  }

  /// `Вікна повідомлень`
  String get messageWindows {
    return Intl.message(
      'Вікна повідомлень',
      name: 'messageWindows',
      desc: '',
      args: [],
    );
  }

  /// `Список задач покищо пустий`
  String get taksIsEmpty {
    return Intl.message(
      'Список задач покищо пустий',
      name: 'taksIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Редагувати`
  String get edit {
    return Intl.message(
      'Редагувати',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Видалити`
  String get delete {
    return Intl.message(
      'Видалити',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Видалити задачу`
  String get deleteTask {
    return Intl.message(
      'Видалити задачу',
      name: 'deleteTask',
      desc: '',
      args: [],
    );
  }

  /// `Ви впевненнi, що хочете видалити задачу - {taskTitle} ?`
  String areYouSureYouWantToDeleteThisTask(Object taskTitle) {
    return Intl.message(
      'Ви впевненнi, що хочете видалити задачу - $taskTitle ?',
      name: 'areYouSureYouWantToDeleteThisTask',
      desc: '',
      args: [taskTitle],
    );
  }

  /// `Задача видалена успiшно`
  String get taskDeletedSuccessfully {
    return Intl.message(
      'Задача видалена успiшно',
      name: 'taskDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Помилка: $error`
  String get failedError {
    return Intl.message(
      'Помилка: \$error',
      name: 'failedError',
      desc: '',
      args: [],
    );
  }

  /// `Внести змiни в задачу`
  String get updateTask {
    return Intl.message(
      'Внести змiни в задачу',
      name: 'updateTask',
      desc: '',
      args: [],
    );
  }

  /// `Вiдмiнити`
  String get cancel {
    return Intl.message(
      'Вiдмiнити',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Зберегти`
  String get save {
    return Intl.message(
      'Зберегти',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Нова задача`
  String get newTask {
    return Intl.message(
      'Нова задача',
      name: 'newTask',
      desc: '',
      args: [],
    );
  }

  /// `Назва`
  String get taskTitle {
    return Intl.message(
      'Назва',
      name: 'taskTitle',
      desc: '',
      args: [],
    );
  }

  /// `Опис`
  String get description {
    return Intl.message(
      'Опис',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Задача успiшно змiнена`
  String get taskUpdatedSuccessfully {
    return Intl.message(
      'Задача успiшно змiнена',
      name: 'taskUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Увага`
  String get attantion {
    return Intl.message(
      'Увага',
      name: 'attantion',
      desc: '',
      args: [],
    );
  }

  /// `Щоб додаток мав можливість працювати з геолокацією, потрібно ввiмкнути GPS на девайсi`
  String get enableGps {
    return Intl.message(
      'Щоб додаток мав можливість працювати з геолокацією, потрібно ввiмкнути GPS на девайсi',
      name: 'enableGps',
      desc: '',
      args: [],
    );
  }

  /// `Щоб додаток мав можливість працювати з геолокацією, потрібно надати відповідні доступи`
  String get locationPermissions {
    return Intl.message(
      'Щоб додаток мав можливість працювати з геолокацією, потрібно надати відповідні доступи',
      name: 'locationPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Налаштування`
  String get settings {
    return Intl.message(
      'Налаштування',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Кнопки`
  String get buttons {
    return Intl.message(
      'Кнопки',
      name: 'buttons',
      desc: '',
      args: [],
    );
  }

  /// `Компоненты вводу`
  String get inputs {
    return Intl.message(
      'Компоненты вводу',
      name: 'inputs',
      desc: '',
      args: [],
    );
  }

  /// `Оплата пройшла!`
  String get paymentSuccessful {
    return Intl.message(
      'Оплата пройшла!',
      name: 'paymentSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Помилка оплати`
  String get paymentFailed {
    return Intl.message(
      'Помилка оплати',
      name: 'paymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Наданий пароль надто слабкий`
  String get thePasswordProvidedIsTooWeak {
    return Intl.message(
      'Наданий пароль надто слабкий',
      name: 'thePasswordProvidedIsTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `Обліковий запис для цієї електронної пошти вже існує`
  String get theAccountAlreadyExistsForThatEmail {
    return Intl.message(
      'Обліковий запис для цієї електронної пошти вже існує',
      name: 'theAccountAlreadyExistsForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `Невiдома помилка`
  String get someError {
    return Intl.message(
      'Невiдома помилка',
      name: 'someError',
      desc: '',
      args: [],
    );
  }

  /// `Авторизація пройшла успішно`
  String get authorizationWasSuccessful {
    return Intl.message(
      'Авторизація пройшла успішно',
      name: 'authorizationWasSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Створення аккаунту пройшло успішно`
  String get signUpWasSuccessful {
    return Intl.message(
      'Створення аккаунту пройшло успішно',
      name: 'signUpWasSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signup {
    return Intl.message(
      'SignUp',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get loginWithApple {
    return Intl.message(
      'Login with Apple',
      name: 'loginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Пароль недійсний або користувач не має пароля`
  String get thePasswordIsInvalidOrTheUserDoesNotHave {
    return Intl.message(
      'Пароль недійсний або користувач не має пароля',
      name: 'thePasswordIsInvalidOrTheUserDoesNotHave',
      desc: '',
      args: [],
    );
  }

  /// `Немає жодного запису користувача, який би відповідав цьому ідентифікатору. Можливо, користувача було видалено.`
  String get thereIsNoUserRecordCorrespondingToThisIdentifierThe {
    return Intl.message(
      'Немає жодного запису користувача, який би відповідав цьому ідентифікатору. Можливо, користувача було видалено.',
      name: 'thereIsNoUserRecordCorrespondingToThisIdentifierThe',
      desc: '',
      args: [],
    );
  }

  /// `Ми заблокували всі запити з цього пристрою через незвичну активність. Спробуйте ще раз пізніше.`
  String get weHaveBlockedAllRequestsFromThisDeviceDueTo {
    return Intl.message(
      'Ми заблокували всі запити з цього пристрою через незвичну активність. Спробуйте ще раз пізніше.',
      name: 'weHaveBlockedAllRequestsFromThisDeviceDueTo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'uk', countryCode: 'UA'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
