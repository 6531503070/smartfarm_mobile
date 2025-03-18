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

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get cancel {
    return Intl.message(
      'CANCEL',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Google Sign-In`
  String get googleSignIn {
    return Intl.message(
      'Google Sign-In',
      name: 'googleSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign-Out`
  String get googleSignOut {
    return Intl.message(
      'Sign-Out',
      name: 'googleSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get error {
    return Intl.message(
      'An error occurred',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message(
      'Reload',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Could not get the data`
  String get fetchFailed {
    return Intl.message(
      'Could not get the data',
      name: 'fetchFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please try again`
  String get pleaseRetry {
    return Intl.message(
      'Please try again',
      name: 'pleaseRetry',
      desc: '',
      args: [],
    );
  }

  /// `For Empty screen`
  String get noResult {
    return Intl.message(
      'For Empty screen',
      name: 'noResult',
      desc: '',
      args: [],
    );
  }

  /// `No Title`
  String get noTitle {
    return Intl.message(
      'No Title',
      name: 'noTitle',
      desc: '',
      args: [],
    );
  }

  /// `Display Name`
  String get displayName {
    return Intl.message(
      'Display Name',
      name: 'displayName',
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

  /// `UserId`
  String get uid {
    return Intl.message(
      'UserId',
      name: 'uid',
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
