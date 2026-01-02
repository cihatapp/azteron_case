/// Type-safe cache keys for SharedPreferences
enum CacheKeys {
  // Auth
  accessToken('access_token'),
  refreshToken('refresh_token'),
  user('user'),

  // Onboarding
  onboardingCompleted('onboarding_completed'),

  // Settings
  themeMode('theme_mode'),
  locale('locale'),
  units('units'),
  mapType('map_type'),

  // Feature flags
  notificationsEnabled('notifications_enabled'),

  // Routes
  savedRoutes('saved_routes'),
  recentRoutes('recent_routes'),
  favoriteLocations('favorite_locations'),

  // Offline & Sync
  pendingSyncOperations('pending_sync_operations'),
  lastSyncTime('last_sync_time'),
  failedSyncOperations('failed_sync_operations'),
  syncStatus('sync_status'),

  // User Settings (Backend)
  userSettings('user_settings'),
  tokenExpiry('token_expiry'),

  // Rate App
  appLaunchCount('app_launch_count'),
  lastRatePromptDate('last_rate_prompt_date'),
  hasRatedApp('has_rated_app'),

  // Subscription
  subscriptionStatus('subscription_status'),
  subscriptionPlan('subscription_plan'),
  subscriptionExpiry('subscription_expiry'),
  hasSeenPaywall('has_seen_paywall'),

  // Search
  recentSearches('recent_searches'),

  // Permissions
  attPermissionRequested('att_permission_requested');

  const CacheKeys(this.key);
  final String key;
}
