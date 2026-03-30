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

  /// `Novira`
  String get appName {
    return Intl.message('Novira', name: 'appName', desc: '', args: []);
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

  /// `Let's begin your journey toward better\nwell-being. We'll personalize your\nexperience.`
  String get onboardingDescription {
    return Intl.message(
      'Let\'s begin your journey toward better\nwell-being. We\'ll personalize your\nexperience.',
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

  /// `I already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'I already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please! Select Your Mood to Start`
  String get pleaseSelectMood {
    return Intl.message(
      'Please! Select Your Mood to Start',
      name: 'pleaseSelectMood',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Safe Space`
  String get createYourSafeSpace {
    return Intl.message(
      'Create Your Safe Space',
      name: 'createYourSafeSpace',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter your full name`
  String get enterFullName {
    return Intl.message(
      'Enter your full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `your.email@example.com`
  String get emailHint {
    return Intl.message(
      'your.email@example.com',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Create a secure password`
  String get createPassword {
    return Intl.message(
      'Create a secure password',
      name: 'createPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Field is required`
  String get fieldRequired {
    return Intl.message(
      'Field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our Terms & Privacy Policy`
  String get termsAndPrivacy {
    return Intl.message(
      'By creating an account, you agree to our Terms & Privacy Policy',
      name: 'termsAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Connection Timeout With Server`
  String get connection_timeout {
    return Intl.message(
      'Connection Timeout With Server',
      name: 'connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Send Timeout With Server`
  String get send_timeout {
    return Intl.message(
      'Send Timeout With Server',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive Timeout With Server`
  String get receive_timeout {
    return Intl.message(
      'Receive Timeout With Server',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect Certificate With Server`
  String get bad_certificate {
    return Intl.message(
      'Incorrect Certificate With Server',
      name: 'bad_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Your Request is Canceled With Server`
  String get cancel_error {
    return Intl.message(
      'Your Request is Canceled With Server',
      name: 'cancel_error',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get no_internet {
    return Intl.message(
      'No Internet Connection',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `Oops, There was Error, Please Try again!`
  String get unknown_error {
    return Intl.message(
      'Oops, There was Error, Please Try again!',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Your Request is Not Found, Please try later`
  String get not_found {
    return Intl.message(
      'Your Request is Not Found, Please try later',
      name: 'not_found',
      desc: '',
      args: [],
    );
  }

  /// `Server Internal Error, Please try later`
  String get server_error {
    return Intl.message(
      'Server Internal Error, Please try later',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get header_login {
    return Intl.message(
      'Welcome Back',
      name: 'header_login',
      desc: '',
      args: [],
    );
  }

  /// `We're glad to see you again.`
  String get sub_header_login {
    return Intl.message(
      'We\'re glad to see you again.',
      name: 'sub_header_login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email \nand we'll send you a reset link.`
  String get instruction_password {
    return Intl.message(
      'Enter your email \nand we\'ll send you a reset link.',
      name: 'instruction_password',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get button_send {
    return Intl.message(
      'Send Reset Link',
      name: 'button_send',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get back_to_login {
    return Intl.message(
      'Back to Login',
      name: 'back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Email`
  String get verify_email {
    return Intl.message(
      'Verify Your Email',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `We've sent a verification link to your email address.`
  String get instruction_email_1 {
    return Intl.message(
      'We\'ve sent a verification link to your email address.',
      name: 'instruction_email_1',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email to continue.`
  String get instruction_email_2 {
    return Intl.message(
      'Please verify your email to continue.',
      name: 'instruction_email_2',
      desc: '',
      args: [],
    );
  }

  /// `Click the verification link in your email to activate your NOVIRA account and start your wellness journey.`
  String get info_text_email {
    return Intl.message(
      'Click the verification link in your email to activate your NOVIRA account and start your wellness journey.',
      name: 'info_text_email',
      desc: '',
      args: [],
    );
  }

  /// `Open Email App`
  String get button_open_email {
    return Intl.message(
      'Open Email App',
      name: 'button_open_email',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get resend_email {
    return Intl.message(
      'Resend Email',
      name: 'resend_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get orContinueWith {
    return Intl.message(
      'or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
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
