abstract class StrogeContract {
  Future<void> save(key, dynamic value);
  Future<dynamic> get(key);
  Future<void> remove(key);
  Future<void> clear();
}