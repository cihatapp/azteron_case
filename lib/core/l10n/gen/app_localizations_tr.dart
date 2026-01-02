// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get messagesTitle => 'Mesajlar';

  @override
  String get searchMessages => 'Mesajlarda ara';

  @override
  String get today => 'Bugün';

  @override
  String get yesterday => 'Dün';

  @override
  String get online => 'Çevrimiçi';

  @override
  String get offline => 'Çevrimdışı';

  @override
  String get typeMessage => 'Bir mesaj yazın...';

  @override
  String get noMessages => 'Henüz mesaj yok';

  @override
  String get noConversations => 'Henüz sohbet yok';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get chats => 'Sohbetler';

  @override
  String get contacts => 'Kişiler';

  @override
  String get settings => 'Ayarlar';

  @override
  String get profile => 'Profil';
}
