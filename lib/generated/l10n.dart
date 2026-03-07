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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `New Journey, Inner Harmony`
  String get appTagline {
    return Intl.message(
      'New Journey, Inner Harmony',
      name: 'appTagline',
      desc: '',
      args: [],
    );
  }

  /// `How are you feeling today?`
  String get howAreYouFeeling {
    return Intl.message(
      'How are you feeling today?',
      name: 'howAreYouFeeling',
      desc: '',
      args: [],
    );
  }

  /// `Happy`
  String get happyMood {
    return Intl.message('Happy', name: 'happyMood', desc: '', args: []);
  }

  /// `Calm`
  String get calmMood {
    return Intl.message('Calm', name: 'calmMood', desc: '', args: []);
  }

  /// `Neutral`
  String get neutralMood {
    return Intl.message('Neutral', name: 'neutralMood', desc: '', args: []);
  }

  /// `Sad`
  String get sadMood {
    return Intl.message('Sad', name: 'sadMood', desc: '', args: []);
  }

  /// `Anxious`
  String get anxiousMood {
    return Intl.message('Anxious', name: 'anxiousMood', desc: '', args: []);
  }

  /// `Overwhelmed`
  String get overwhelmedMood {
    return Intl.message(
      'Overwhelmed',
      name: 'overwhelmedMood',
      desc: '',
      args: [],
    );
  }

  /// `Let's begin your journey toward better\n well-being. We'll personalize your\n experience.`
  String get onboardingDescription {
    return Intl.message(
      'Let\'s begin your journey toward better\n well-being. We\'ll personalize your\n experience.',
      name: 'onboardingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Start Your Journey`
  String get startYourJourney {
    return Intl.message(
      'Start Your Journey',
      name: 'startYourJourney',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account`
  String get alreadyHaveAccount {
    return Intl.message(
      'I already have an account',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
