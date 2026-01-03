/// Singleton class for managing SVG asset paths.
///
/// Provides centralized access to all image assets used in the app.
/// Using a singleton pattern ensures consistent asset path management
/// and makes it easy to update paths in one place.
class AppAssets {
  AppAssets._();

  static final AppAssets _instance = AppAssets._();

  /// Returns the singleton instance of [AppAssets].
  static AppAssets get instance => _instance;

  // ─────────────────────────────────────────────────
  // Images
  // ─────────────────────────────────────────────────

  /// Heart logo used in Messages app bar
  String get heartLogo => 'assets/images/heart.svg';

  /// Search icon for search fields
  String get searchIcon => 'assets/images/search.svg';

  /// Chatting icon for navigation
  String get chattingIcon => 'assets/images/chatting.svg';

  /// Discover icon for navigation
  String get discoverIcon => 'assets/images/discover.svg';

  /// Like icon for interactions
  String get likeIcon => 'assets/images/like.svg';

  /// Profile icon for user profile
  String get profileIcon => 'assets/images/profile.svg';
}
