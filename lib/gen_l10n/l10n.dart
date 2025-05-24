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

  /// `Inspection Date (DD/MM/YYYY - HH:mm)`
  String get inspectionDate {
    return Intl.message(
      'Inspection Date (DD/MM/YYYY - HH:mm)',
      name: 'inspectionDate',
      desc: '',
      args: [],
    );
  }

  /// `Planting Section (per zone overview)`
  String get plantingSection {
    return Intl.message(
      'Planting Section (per zone overview)',
      name: 'plantingSection',
      desc: '',
      args: [],
    );
  }

  /// `Strength (% per zone)`
  String get strengthPerZone {
    return Intl.message(
      'Strength (% per zone)',
      name: 'strengthPerZone',
      desc: '',
      args: [],
    );
  }

  /// `Germination Rate (% per zone)`
  String get germinationRatePerZone {
    return Intl.message(
      'Germination Rate (% per zone)',
      name: 'germinationRatePerZone',
      desc: '',
      args: [],
    );
  }

  /// `Watering Method`
  String get wateringMethod {
    return Intl.message(
      'Watering Method',
      name: 'wateringMethod',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message(
      'None',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  /// `Drip`
  String get drip {
    return Intl.message(
      'Drip',
      name: 'drip',
      desc: '',
      args: [],
    );
  }

  /// `Spray`
  String get spray {
    return Intl.message(
      'Spray',
      name: 'spray',
      desc: '',
      args: [],
    );
  }

  /// `Hand Watering`
  String get handWatering {
    return Intl.message(
      'Hand Watering',
      name: 'handWatering',
      desc: '',
      args: [],
    );
  }

  /// `Fertilized`
  String get fertilized {
    return Intl.message(
      'Fertilized',
      name: 'fertilized',
      desc: '',
      args: [],
    );
  }

  /// `Pest Found`
  String get pestFound {
    return Intl.message(
      'Pest Found',
      name: 'pestFound',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `- Pests found and quantity (aphids, worms, fungi, etc.)\n- Pest management method (chemical/biological, substance name, usage rate)\n\nOther notes`
  String get plantingNotePlaceholder {
    return Intl.message(
      '- Pests found and quantity (aphids, worms, fungi, etc.)\n- Pest management method (chemical/biological, substance name, usage rate)\n\nOther notes',
      name: 'plantingNotePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Harvest Section (per zone overview)`
  String get harvestSection {
    return Intl.message(
      'Harvest Section (per zone overview)',
      name: 'harvestSection',
      desc: '',
      args: [],
    );
  }

  /// `Total Harvested (per zone)`
  String get totalHarvested {
    return Intl.message(
      'Total Harvested (per zone)',
      name: 'totalHarvested',
      desc: '',
      args: [],
    );
  }

  /// `Total Weight (kg)`
  String get totalWeight {
    return Intl.message(
      'Total Weight (kg)',
      name: 'totalWeight',
      desc: '',
      args: [],
    );
  }

  /// `Damaged/Defective (kg)`
  String get damagedDefective {
    return Intl.message(
      'Damaged/Defective (kg)',
      name: 'damagedDefective',
      desc: '',
      args: [],
    );
  }

  /// `Other notes`
  String get otherNotes {
    return Intl.message(
      'Other notes',
      name: 'otherNotes',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Zone`
  String get zone {
    return Intl.message(
      'Zone',
      name: 'zone',
      desc: '',
      args: [],
    );
  }

  /// `Strength (%)`
  String get strength {
    return Intl.message(
      'Strength (%)',
      name: 'strength',
      desc: '',
      args: [],
    );
  }

  /// `Germination Rate (%)`
  String get germinationRate {
    return Intl.message(
      'Germination Rate (%)',
      name: 'germinationRate',
      desc: '',
      args: [],
    );
  }

  /// `Watering Method`
  String get wateringMethodHeader {
    return Intl.message(
      'Watering Method',
      name: 'wateringMethodHeader',
      desc: '',
      args: [],
    );
  }

  /// `Fertilized`
  String get fertilizedHeader {
    return Intl.message(
      'Fertilized',
      name: 'fertilizedHeader',
      desc: '',
      args: [],
    );
  }

  /// `Pest Found`
  String get pestFoundHeader {
    return Intl.message(
      'Pest Found',
      name: 'pestFoundHeader',
      desc: '',
      args: [],
    );
  }

  /// `Planting Notes`
  String get plantingNotesHeader {
    return Intl.message(
      'Planting Notes',
      name: 'plantingNotesHeader',
      desc: '',
      args: [],
    );
  }

  /// `Total Harvested`
  String get totalHarvestedHeader {
    return Intl.message(
      'Total Harvested',
      name: 'totalHarvestedHeader',
      desc: '',
      args: [],
    );
  }

  /// `Total Weight (kg)`
  String get totalWeightHeader {
    return Intl.message(
      'Total Weight (kg)',
      name: 'totalWeightHeader',
      desc: '',
      args: [],
    );
  }

  /// `Damaged/Defective (kg)`
  String get damagedDefectiveHeader {
    return Intl.message(
      'Damaged/Defective (kg)',
      name: 'damagedDefectiveHeader',
      desc: '',
      args: [],
    );
  }

  /// `Harvest Notes`
  String get harvestNotesHeader {
    return Intl.message(
      'Harvest Notes',
      name: 'harvestNotesHeader',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Good quality`
  String get goodQuality {
    return Intl.message(
      'Good quality',
      name: 'goodQuality',
      desc: '',
      args: [],
    );
  }

  /// `Some small fruits`
  String get someSmallFruits {
    return Intl.message(
      'Some small fruits',
      name: 'someSmallFruits',
      desc: '',
      args: [],
    );
  }

  /// `Aphids, low`
  String get aphidsLow {
    return Intl.message(
      'Aphids, low',
      name: 'aphidsLow',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get dash {
    return Intl.message(
      '-',
      name: 'dash',
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
