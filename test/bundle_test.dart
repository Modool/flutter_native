import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

// ignore: avoid_implementing_value_types
class MockNativeTarget extends Mock implements NativeTarget {}

// ignore: avoid_implementing_value_types
class MockNativeMethod extends Mock implements NativeMethod {}

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final bundle = Bundle(target);

  void _when<T>(String name, List arguments, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.method(name, arguments: arguments))),
    )).thenAnswer((_) async => result);
  }

  void _whenProperty<T>(String name, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.property(name))),
    )).thenAnswer((_) async => result);
  }

  test('global', () async {
    expect(Bundle.main(), isNotNull);

    final mockTarget = MockNativeTarget();
    final mockMethod = MockNativeMethod();

    when(mockTarget.method('bundleWithPath:', arguments: ['xxx/xx/xx'])).thenAnswer((_) => mockMethod);

    when(mockMethod.keep()).thenAnswer((_) async => true);
    when(mockMethod.dispose()).thenAnswer((_) async => true);

    final bundle = await Bundle.from('xxx/xx/xx', mockTarget);

    expect(bundle, isInstanceOf<Bundle>());
    expect(await bundle.dispose(), true);

    when(mockMethod.keep()).thenAnswer((_) async => false);
    expect(await Bundle.from('xxx/xx/xx', mockTarget), null);
  });

  test('bundlePath', () async {
    _whenProperty<String>('bundlePath', 'ok');
    expect(await bundle.bundlePath, 'ok');
  });

  test('resourcePath', () async {
    _whenProperty<String>('resourcePath', 'ok');
    expect(await bundle.resourcePath, 'ok');
  });

  test('executablePath', () async {
    _whenProperty<String>('executablePath', 'ok');
    expect(await bundle.executablePath, 'ok');
  });

  test('privateFrameworksPath', () async {
    _whenProperty<String>('privateFrameworksPath', 'ok');
    expect(await bundle.privateFrameworksPath, 'ok');
  });

  test('sharedFrameworksPath', () async {
    _whenProperty<String>('sharedFrameworksPath', 'ok');
    expect(await bundle.sharedFrameworksPath, 'ok');
  });

  test('sharedSupportPath', () async {
    _whenProperty<String>('sharedSupportPath', 'ok');
    expect(await bundle.sharedSupportPath, 'ok');
  });

  test('builtInPlugInsPath', () async {
    _whenProperty<String>('builtInPlugInsPath', 'ok');
    expect(await bundle.builtInPlugInsPath, 'ok');
  });

  test('appStoreReceiptUri', () async {
    _whenProperty<String>('appStoreReceiptURL', 'ok');
    expect(await bundle.appStoreReceiptUri, 'ok');
  });

  test('sharedSupportUri', () async {
    _whenProperty<String>('sharedSupportURL', 'ok');
    expect(await bundle.sharedSupportUri, 'ok');
  });

  test('bundleIdentifier', () async {
    _whenProperty<String>('bundleIdentifier', 'ok');
    expect(await bundle.bundleIdentifier, 'ok');
  });

  test('info', () async {
    _whenProperty<Map>('infoDictionary', {'1': 'ok'});
    expect(await bundle.info, {'1': 'ok'});
  });

  test('localizedInfo', () async {
    _whenProperty<Map>('localizedInfoDictionary', {'1': 'ok'});
    expect(await bundle.localizedInfo, {'1': 'ok'});
  });

  test('executableArchitectures', () async {
    _whenProperty<List>('executableArchitectures', ['1']);
    expect(await bundle.executableArchitectures, ['1']);
  });

  test('pathForResource:ofType:inDirectory:forLocalization:', () async {
    _when<String>('pathForResource:ofType:inDirectory:forLocalization:', ['1', '2', '3', '4'], 'ok');
    expect(await bundle.pathForResource('1', '2', '3', '4'), 'ok');
  });

  test('pathsForResourcesOfType:inDirectory:forLocalization:', () async {
    _when<List<String>>('pathsForResourcesOfType:inDirectory:forLocalization:', ['1', '2', '3'], ['ok']);
    expect(await bundle.pathsForResourcesOfType('1', '2', '3'), ['ok']);
  });
}
