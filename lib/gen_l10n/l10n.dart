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

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Smart Farming`
  String get projectName {
    return Intl.message(
      'Smart Farming',
      name: 'projectName',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Contact us / Forgot password?`
  String get forgotPasswordOrContactUs {
    return Intl.message(
      'Contact us / Forgot password?',
      name: 'forgotPasswordOrContactUs',
      desc: '',
      args: [],
    );
  }

  /// `Today is a new day. It's your day. You shape it. Sign in to start managing farm.`
  String get welcomeSignIn {
    return Intl.message(
      'Today is a new day. It\'s your day. You shape it. Sign in to start managing farm.',
      name: 'welcomeSignIn',
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

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `IOT Controls`
  String get controlPage {
    return Intl.message(
      'IOT Controls',
      name: 'controlPage',
      desc: '',
      args: [],
    );
  }

  /// `Data Management`
  String get dataPage {
    return Intl.message(
      'Data Management',
      name: 'dataPage',
      desc: '',
      args: [],
    );
  }

  /// `Water Usage`
  String get waterUsage {
    return Intl.message(
      'Water Usage',
      name: 'waterUsage',
      desc: '',
      args: [],
    );
  }

  /// `Avg. Temperature`
  String get avgTemperature {
    return Intl.message(
      'Avg. Temperature',
      name: 'avgTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Avg. Rainfall`
  String get avgRainfall {
    return Intl.message(
      'Avg. Rainfall',
      name: 'avgRainfall',
      desc: '',
      args: [],
    );
  }

  /// `Yield & Disease`
  String get yieldAndDisease {
    return Intl.message(
      'Yield & Disease',
      name: 'yieldAndDisease',
      desc: '',
      args: [],
    );
  }

  /// `Disease Detection`
  String get diseaseDetection {
    return Intl.message(
      'Disease Detection',
      name: 'diseaseDetection',
      desc: '',
      args: [],
    );
  }

  /// `Prev`
  String get prev {
    return Intl.message(
      'Prev',
      name: 'prev',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Yield Detection`
  String get yieldDetection {
    return Intl.message(
      'Yield Detection',
      name: 'yieldDetection',
      desc: '',
      args: [],
    );
  }

  /// `How it affects (Description)`
  String get howItAffects {
    return Intl.message(
      'How it affects (Description)',
      name: 'howItAffects',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Harvest`
  String get harvest {
    return Intl.message(
      'Harvest',
      name: 'harvest',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Produce Amount (Per Tree)`
  String get produceAmount {
    return Intl.message(
      'Produce Amount (Per Tree)',
      name: 'produceAmount',
      desc: '',
      args: [],
    );
  }

  /// `Export to local (Excel file .xlsx)`
  String get exportToLocal {
    return Intl.message(
      'Export to local (Excel file .xlsx)',
      name: 'exportToLocal',
      desc: '',
      args: [],
    );
  }

  /// `Soil Moisture`
  String get soilMoisture {
    return Intl.message(
      'Soil Moisture',
      name: 'soilMoisture',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get temperature {
    return Intl.message(
      'Temperature',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `Watering`
  String get watering {
    return Intl.message(
      'Watering',
      name: 'watering',
      desc: '',
      args: [],
    );
  }

  /// `Watering Schedule`
  String get wateringSchedule {
    return Intl.message(
      'Watering Schedule',
      name: 'wateringSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Raining`
  String get raining {
    return Intl.message(
      'Raining',
      name: 'raining',
      desc: '',
      args: [],
    );
  }

  /// `Not raining`
  String get notRaining {
    return Intl.message(
      'Not raining',
      name: 'notRaining',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Show Seconds`
  String get showSeconds {
    return Intl.message(
      'Show Seconds',
      name: 'showSeconds',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get stop {
    return Intl.message(
      'Stop',
      name: 'stop',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'my'),
      Locale.fromSubtags(languageCode: 'th'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
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
