import 'package:flutter/cupertino.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class UserDefaults implements NativeRuntimeClass {
  UserDefaults(this._target);

  factory UserDefaults.standard() =>
      UserDefaults(classTarget.property('standardUserDefaults'));

  static Future<UserDefaults> named(
      String suiteName, NativeTarget classTarget) async {
    final target = classTarget
        .method('alloc')
        .method('initWithSuiteName:', arguments: [suiteName]);
    final success = await target.keep();
    if (!success) return null;

    return UserDefaults(target);
  }

  static final classTarget = NativeRuntime().classNamed('NSUserDefaults');

  final NativeTarget _target;

  @override
  Future<bool> dispose() => _target.dispose();

  Future<T> objectForKey<T>(String key) =>
      _target.method('objectForKey:', arguments: [key]).invoke<T>();

  Future<bool> boolForKey(String key) =>
      _target.method('boolForKey:', arguments: [key]).invoke<bool>();

  Future<void> setBool({
    @required bool value,
    @required String key,
  }) =>
      _target.method('setBool:forKey:', arguments: [value, key]).invoke<void>();

  Future<int> intForKey(String key) =>
      _target.method('integerForKey:', arguments: [key]).invoke<int>();

  Future<void> setInt(int value, String key) => _target
      .method('setInteger:forKey:', arguments: [value, key]).invoke<void>();

  Future<double> doubleForKey(String key) =>
      _target.method('doubleForKey:', arguments: [key]).invoke<double>();

  Future<void> setDouble(double value, String key) => _target
      .method('setDouble:forKey:', arguments: [value, key]).invoke<void>();

  Future<String> stringForKey(String key) =>
      _target.method('stringForKey:', arguments: [key]).invoke<String>();

  Future<void> setString(String value, String key) => _target
      .method('setObject:forKey:', arguments: [value, key]).invoke<void>();

  Future<void> setObject(value, String key) => _target
      .method('setObject:forKey:', arguments: [value, key]).invoke<void>();

  Future<Map<String, dynamic>> mapForKey(String key) async => (await _target
          .method('dictionaryForKey:', arguments: [key]).invoke<Map>())
      .cast<String, dynamic>();

  Future<List> listForKey(String key) =>
      _target.method('arrayForKey:', arguments: [key]).invoke<List>();

  Future<List<String>> stringListForKey(String key) async => (await _target
          .method('stringArrayForKey:', arguments: [key]).invoke<List>())
      .cast<String>();

  Future<void> setUri(Uri uri, String key) =>
      _target.method('setURL:forKey:', arguments: [uri, key]).invoke<void>();

  Future<void> registerDefaults(Map map) =>
      _target.method('registerDefaults:', arguments: [map]).invoke<void>();

  Future<void> addSuite(String name) =>
      _target.method('addSuiteNamed:', arguments: [name]).invoke<void>();

  Future<void> removeSuite(String name) =>
      _target.method('removeSuiteNamed:', arguments: [name]).invoke<void>();

  Future<Map<String, dynamic>> get representation async =>
      (await _target.method('dictionaryRepresentation').invoke<Map>())
          .cast<String, dynamic>();

  Future<List<String>> get volatileDomainNames async =>
      (await _target.method('volatileDomainNames').invoke<List>())
          .cast<String>();

  Future<Map<String, dynamic>> volatileDomainNamed(String name) async =>
      (await _target.method('volatileDomainForName:',
              arguments: [name]).invoke<Map>())
          .cast<String, dynamic>();

  Future<void> setVolatileDomain(Map<String, dynamic> domain, String name) =>
      _target.method('setVolatileDomain:forName:',
          arguments: [domain, name]).invoke<void>();

  Future<void> removeVolatileDomain(String name) => _target
      .method('removeVolatileDomainForName:', arguments: [name]).invoke<void>();

  Future<List<String>> get persistentDomainNames async =>
      (await _target.method('persistentDomainNames').invoke<List>())
          .cast<String>();

  Future<Map<String, dynamic>> persistentDomainNamed(String name) async =>
      (await _target.method('persistentDomainForName:',
              arguments: [name]).invoke<Map>())
          .cast<String, dynamic>();

  Future<void> setPersistentDomain(
          Map<String, dynamic> domain, String name) async =>
      _target.method('setPersistentDomain:forName:',
          arguments: [domain, name]).invoke<void>();

  Future<void> removePersistentDomain(String name) =>
      _target.method('removePersistentDomainForName:',
          arguments: [name]).invoke<void>();

  Future<bool> synchronize() => _target.method('synchronize').invoke<bool>();

  Future<bool> objectIsForcedForKey(String key, {String domain}) {
    if (domain == null || domain.isEmpty) {
      return _target
          .method('objectIsForcedForKey:', arguments: [key]).invoke<bool>();
    }
    return _target.method('objectIsForcedForKey:inDomain:',
        arguments: [key, domain]).invoke<bool>();
  }
}
