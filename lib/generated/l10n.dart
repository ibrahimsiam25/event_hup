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

  /// `EventHub`
  String get eventHub {
    return Intl.message(
      'EventHub',
      name: 'eventHub',
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

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `abc@email.com`
  String get emailHint {
    return Intl.message(
      'abc@email.com',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get passwordHint {
    return Intl.message(
      'Your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullNameHint {
    return Intl.message(
      'Full name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get signInButton {
    return Intl.message(
      'SIGN IN',
      name: 'signInButton',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signUpButton {
    return Intl.message(
      'SIGN UP',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
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

  /// `Login with Facebook`
  String get loginWithFacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'loginWithFacebook',
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

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInAction {
    return Intl.message(
      'Sign in',
      name: 'signInAction',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get emailRequired {
    return Intl.message(
      'Please enter your email',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordRequired {
    return Intl.message(
      'Please enter your password',
      name: 'passwordRequired',
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

  /// `Password must be at least 8 characters and contain both letters and numbers`
  String get invalidPassword {
    return Intl.message(
      'Password must be at least 8 characters and contain both letters and numbers',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get fullNameRequired {
    return Intl.message(
      'Please enter your full name',
      name: 'fullNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordRequired',
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

  /// `Event Details`
  String get eventDetails {
    return Intl.message(
      'Event Details',
      name: 'eventDetails',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `No Upcoming Event`
  String get noUpcomingEvent {
    return Intl.message(
      'No Upcoming Event',
      name: 'noUpcomingEvent',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet,\n consectetur`
  String get noUpcomingEventDescription {
    return Intl.message(
      'Lorem ipsum dolor sit amet,\n consectetur',
      name: 'noUpcomingEventDescription',
      desc: '',
      args: [],
    );
  }

  /// `Explore Events`
  String get exploreEvents {
    return Intl.message(
      'Explore Events',
      name: 'exploreEvents',
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

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Past Events`
  String get pastEvents {
    return Intl.message(
      'Past Events',
      name: 'pastEvents',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get searchHint {
    return Intl.message(
      'Search...',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get sports {
    return Intl.message(
      'Sports',
      name: 'sports',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get food {
    return Intl.message(
      'Food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Art`
  String get art {
    return Intl.message(
      'Art',
      name: 'art',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Events`
  String get upcomingEvents {
    return Intl.message(
      'Upcoming Events',
      name: 'upcomingEvents',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Going`
  String get going {
    return Intl.message(
      'Going',
      name: 'going',
      desc: '',
      args: [],
    );
  }

  /// `Invite your friends`
  String get inviteFriends {
    return Intl.message(
      'Invite your friends',
      name: 'inviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `Get $20 for ticket`
  String get get20ForTicket {
    return Intl.message(
      'Get \$20 for ticket',
      name: 'get20ForTicket',
      desc: '',
      args: [],
    );
  }

  /// `INVITE`
  String get invite {
    return Intl.message(
      'INVITE',
      name: 'invite',
      desc: '',
      args: [],
    );
  }

  /// `Nearby You`
  String get nearbyYou {
    return Intl.message(
      'Nearby You',
      name: 'nearbyYou',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
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

  /// `Current Location`
  String get currentLocation {
    return Intl.message(
      'Current Location',
      name: 'currentLocation',
      desc: '',
      args: [],
    );
  }

  /// `New York, USA`
  String get newYorkUSA {
    return Intl.message(
      'New York, USA',
      name: 'newYorkUSA',
      desc: '',
      args: [],
    );
  }

  /// `Explore Map`
  String get exploreMap {
    return Intl.message(
      'Explore Map',
      name: 'exploreMap',
      desc: '',
      args: [],
    );
  }

  /// `Search for events...`
  String get searchForEvents {
    return Intl.message(
      'Search for events...',
      name: 'searchForEvents',
      desc: '',
      args: [],
    );
  }

  /// `Past`
  String get pastLabel {
    return Intl.message(
      'Past',
      name: 'pastLabel',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `My Events`
  String get myEvents {
    return Intl.message(
      'My Events',
      name: 'myEvents',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarked Events`
  String get bookmarkedEvents {
    return Intl.message(
      'Bookmarked Events',
      name: 'bookmarkedEvents',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
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

  /// `Create New Event`
  String get createNewEvent {
    return Intl.message(
      'Create New Event',
      name: 'createNewEvent',
      desc: '',
      args: [],
    );
  }

  /// `Event Title`
  String get eventTitle {
    return Intl.message(
      'Event Title',
      name: 'eventTitle',
      desc: '',
      args: [],
    );
  }

  /// `Date & Time`
  String get dateTime {
    return Intl.message(
      'Date & Time',
      name: 'dateTime',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `CREATE EVENT`
  String get createEvent {
    return Intl.message(
      'CREATE EVENT',
      name: 'createEvent',
      desc: '',
      args: [],
    );
  }

  /// `Event created successfully!`
  String get eventCreatedSuccessfully {
    return Intl.message(
      'Event created successfully!',
      name: 'eventCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `International Band Music Concert`
  String get concertTitle1 {
    return Intl.message(
      'International Band Music Concert',
      name: 'concertTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Jo Malone London's Mother's Day Concert`
  String get concertTitle2 {
    return Intl.message(
      'Jo Malone London\'s Mother\'s Day Concert',
      name: 'concertTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Gala Art Exhibition & Gallery Day`
  String get artExhibitionTitle {
    return Intl.message(
      'Gala Art Exhibition & Gallery Day',
      name: 'artExhibitionTitle',
      desc: '',
      args: [],
    );
  }

  /// `36 Guild Street London, UK`
  String get address1 {
    return Intl.message(
      '36 Guild Street London, UK',
      name: 'address1',
      desc: '',
      args: [],
    );
  }

  /// `Radius Gallery London, UK`
  String get address2 {
    return Intl.message(
      'Radius Gallery London, UK',
      name: 'address2',
      desc: '',
      args: [],
    );
  }

  /// `Convention Center New York, USA`
  String get address3 {
    return Intl.message(
      'Convention Center New York, USA',
      name: 'address3',
      desc: '',
      args: [],
    );
  }

  /// `Food & Wine Festival`
  String get foodFestivalTitle {
    return Intl.message(
      'Food & Wine Festival',
      name: 'foodFestivalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Summer Sports Championship`
  String get sportsChampionshipTitle {
    return Intl.message(
      'Summer Sports Championship',
      name: 'sportsChampionshipTitle',
      desc: '',
      args: [],
    );
  }

  /// `Jazz Music Under the Stars`
  String get jazzMusicTitle {
    return Intl.message(
      'Jazz Music Under the Stars',
      name: 'jazzMusicTitle',
      desc: '',
      args: [],
    );
  }

  /// `Central Park, New York`
  String get addressCentralPark {
    return Intl.message(
      'Central Park, New York',
      name: 'addressCentralPark',
      desc: '',
      args: [],
    );
  }

  /// `MetLife Stadium, NJ`
  String get addressMetLife {
    return Intl.message(
      'MetLife Stadium, NJ',
      name: 'addressMetLife',
      desc: '',
      args: [],
    );
  }

  /// `Broadway Theatre, NY`
  String get addressBroadway {
    return Intl.message(
      'Broadway Theatre, NY',
      name: 'addressBroadway',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get aboutMe {
    return Intl.message(
      'About Me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `Interest`
  String get interest {
    return Intl.message(
      'Interest',
      name: 'interest',
      desc: '',
      args: [],
    );
  }

  /// `CHANGE`
  String get changeBtn {
    return Intl.message(
      'CHANGE',
      name: 'changeBtn',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Read More`
  String get readMore {
    return Intl.message(
      'Read More',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Read Less`
  String get readLess {
    return Intl.message(
      'Read Less',
      name: 'readLess',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get followingLabel {
    return Intl.message(
      'Following',
      name: 'followingLabel',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followersLabel {
    return Intl.message(
      'Followers',
      name: 'followersLabel',
      desc: '',
      args: [],
    );
  }

  /// `Games Online`
  String get gamesOnline {
    return Intl.message(
      'Games Online',
      name: 'gamesOnline',
      desc: '',
      args: [],
    );
  }

  /// `Concert`
  String get concert {
    return Intl.message(
      'Concert',
      name: 'concert',
      desc: '',
      args: [],
    );
  }

  /// `Movie`
  String get movie {
    return Intl.message(
      'Movie',
      name: 'movie',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others {
    return Intl.message(
      'Others',
      name: 'others',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get followBtn {
    return Intl.message(
      'Follow',
      name: 'followBtn',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messagesBtn {
    return Intl.message(
      'Messages',
      name: 'messagesBtn',
      desc: '',
      args: [],
    );
  }

  /// `ABOUT`
  String get aboutTab {
    return Intl.message(
      'ABOUT',
      name: 'aboutTab',
      desc: '',
      args: [],
    );
  }

  /// `EVENT`
  String get eventTab {
    return Intl.message(
      'EVENT',
      name: 'eventTab',
      desc: '',
      args: [],
    );
  }

  /// `REVIEWS`
  String get reviewsTab {
    return Intl.message(
      'REVIEWS',
      name: 'reviewsTab',
      desc: '',
      args: [],
    );
  }

  /// `Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.`
  String get reviewDefaultText {
    return Intl.message(
      'Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.',
      name: 'reviewDefaultText',
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
