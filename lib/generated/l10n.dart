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

  /// `About the community`
  String get about_community {
    return Intl.message(
      'About the community',
      name: 'about_community',
      desc: '',
      args: [],
    );
  }

  /// `Meet Our Generations`
  String get aboutus {
    return Intl.message(
      'Meet Our Generations',
      name: 'aboutus',
      desc: '',
      args: [],
    );
  }

  /// `It is a cultural developmental institution that aspires to renew and leave an effective imprint at the local and Arab levels, our generations are a supportive institution for the new generation in various fields, sports, scientifically, culturally and artistically.`
  String get aboutusbody {
    return Intl.message(
      'It is a cultural developmental institution that aspires to renew and leave an effective imprint at the local and Arab levels, our generations are a supportive institution for the new generation in various fields, sports, scientifically, culturally and artistically.',
      name: 'aboutusbody',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Choose From Gallery`
  String get choosefromgallery {
    return Intl.message(
      'Choose From Gallery',
      name: 'choosefromgallery',
      desc: '',
      args: [],
    );
  }

  /// `Choose a picture from the gallery or take a new one`
  String get chooseImageFrom {
    return Intl.message(
      'Choose a picture from the gallery or take a new one',
      name: 'chooseImageFrom',
      desc: '',
      args: [],
    );
  }

  /// `ConfirmPassword`
  String get confirmPassword {
    return Intl.message(
      'ConfirmPassword',
      name: 'confirmPassword',
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

  /// `Delect Account`
  String get delectAccount {
    return Intl.message(
      'Delect Account',
      name: 'delectAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Dont Have an Account?`
  String get dontHaveAccount {
    return Intl.message(
      'Dont Have an Account?',
      name: 'dontHaveAccount',
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

  /// `Enter Your Password`
  String get enterPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get enterYourPhone {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'enterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Episode`
  String get episode {
    return Intl.message(
      'Episode',
      name: 'episode',
      desc: '',
      args: [],
    );
  }

  /// `Episodes`
  String get episodes {
    return Intl.message(
      'Episodes',
      name: 'episodes',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get event {
    return Intl.message(
      'Events',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Fill out your information below or register using your social account`
  String get fillInfromation {
    return Intl.message(
      'Fill out your information below or register using your social account',
      name: 'fillInfromation',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Do you Have Account?`
  String get haveAccount {
    return Intl.message(
      'Do you Have Account?',
      name: 'haveAccount',
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

  /// `Listen At :`
  String get listenAt {
    return Intl.message(
      'Listen At :',
      name: 'listenAt',
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

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `More Detils`
  String get moreDetils {
    return Intl.message(
      'More Detils',
      name: 'moreDetils',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
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

  /// `Open Notifications`
  String get openNotifi {
    return Intl.message(
      'Open Notifications',
      name: 'openNotifi',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Or Email `
  String get phoneOrEmail {
    return Intl.message(
      'Phone Number Or Email ',
      name: 'phoneOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Places to buy tickets`
  String get places_to_buy_tickets {
    return Intl.message(
      'Places to buy tickets',
      name: 'places_to_buy_tickets',
      desc: '',
      args: [],
    );
  }

  /// `New Generation Platform`
  String get platform {
    return Intl.message(
      'New Generation Platform',
      name: 'platform',
      desc: '',
      args: [],
    );
  }

  /// `Platfrom Work`
  String get platform_work {
    return Intl.message(
      'Platfrom Work',
      name: 'platform_work',
      desc: '',
      args: [],
    );
  }

  /// `Playlists`
  String get playlists {
    return Intl.message(
      'Playlists',
      name: 'playlists',
      desc: '',
      args: [],
    );
  }

  /// ` New Generation Podcast`
  String get podcast {
    return Intl.message(
      ' New Generation Podcast',
      name: 'podcast',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Reserve`
  String get reserve {
    return Intl.message(
      'Reserve',
      name: 'reserve',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Login Successfully`
  String get successlogin {
    return Intl.message(
      'Login Successfully',
      name: 'successlogin',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account Successfully`
  String get successSignUp {
    return Intl.message(
      'Create New Account Successfully',
      name: 'successSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure`
  String get Sure {
    return Intl.message(
      'Are You Sure',
      name: 'Sure',
      desc: '',
      args: [],
    );
  }

  /// `Take It By Camera `
  String get takebycamera {
    return Intl.message(
      'Take It By Camera ',
      name: 'takebycamera',
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

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Hi! We Missed You`
  String get wellcomBack {
    return Intl.message(
      'Hi! We Missed You',
      name: 'wellcomBack',
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
