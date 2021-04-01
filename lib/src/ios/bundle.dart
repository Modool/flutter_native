import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class Bundle implements NativeRuntimeClass {
  Bundle(this._target);

  factory Bundle.main() => Bundle(classTarget.property('mainBundle'));

  static Future<Bundle> from(String path, NativeTarget classTarget) async {
    final target = classTarget.method('bundleWithPath:', arguments: [path]);
    final success = await target.keep();
    if (!success) return null;

    return Bundle(target);
  }

  @override
  Future<bool> dispose() => _target.dispose();

  static final classTarget = NativeRuntime().classNamed('NSBundle');

  final NativeTarget _target;

  Future<String> get bundlePath => _target.property('bundlePath').get<String>();

  Future<String> get resourcePath =>
      _target.property('resourcePath').get<String>();

  Future<String> get executablePath =>
      _target.property('executablePath').get<String>();

  Future<String> get privateFrameworksPath =>
      _target.property('privateFrameworksPath').get<String>();

  Future<String> get sharedFrameworksPath =>
      _target.property('sharedFrameworksPath').get<String>();

  Future<String> get sharedSupportPath =>
      _target.property('sharedSupportPath').get<String>();

  Future<String> get builtInPlugInsPath =>
      _target.property('builtInPlugInsPath').get<String>();

  Future<String> get appStoreReceiptUri =>
      _target.property('appStoreReceiptURL').get<String>();

  Future<String> get sharedSupportUri =>
      _target.property('sharedSupportURL').get<String>();

  Future<String> get bundleIdentifier =>
      _target.property('bundleIdentifier').get<String>();

  Future<Map> get info => _target.property('infoDictionary').get<Map>();

  Future<Map> get localizedInfo =>
      _target.property('localizedInfoDictionary').get<Map>();

  Future<List> get executableArchitectures =>
      _target.property('executableArchitectures').get<List>();

  Future<String> pathForResource(String name, String type, String directory,
          String localizationName) =>
      _target.method('pathForResource:ofType:inDirectory:forLocalization:',
          arguments: [
            name,
            type,
            directory,
            localizationName
          ]).invoke<String>();

  Future<List<String>> pathsForResourcesOfType(
          String type, String directory, String localizationName) =>
      _target.method('pathsForResourcesOfType:inDirectory:forLocalization:',
          arguments: [
            type,
            directory,
            localizationName
          ]).invoke<List<String>>();
}
