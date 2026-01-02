// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get messagesTitle => 'Messages';

  @override
  String get searchMessages => 'Search messages';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get typeMessage => 'Type a message...';

  @override
  String get noMessages => 'No messages yet';

  @override
  String get noConversations => 'No conversations yet';

  @override
  String get home => 'Home';

  @override
  String get chats => 'Chats';

  @override
  String get contacts => 'Contacts';

  @override
  String get settings => 'Settings';

  @override
  String get profile => 'Profile';
}
