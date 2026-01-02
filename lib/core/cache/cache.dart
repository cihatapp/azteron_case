// Cache module barrel file
//
// Provides SharedPreferences-based caching with type-safe access.
//
// Usage:
// ```dart
// import 'package:route_planner/core/cache/cache.dart';
//
// // Initialize in main()
// await CacheManager.instance.init();
//
// // Use cache
// await CacheManager.instance.setString(CacheKeys.accessToken, token);
// final token = CacheManager.instance.getString(CacheKeys.accessToken);
// ```

export 'cache_keys.dart';
export 'cache_manager.dart';
export 'cacheable_model.dart';
