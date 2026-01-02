/// Interface for objects that can be cached.
/// Used as a type constraint for generic cache methods.
// ignore: one_member_abstracts
abstract class CacheableModel {
  /// Converts the model to a JSON-compatible map for caching.
  Map<String, dynamic> toJson();
}
