import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

// ignore: avoid_implementing_value_types
class MockNativeTarget extends Mock implements NativeTarget {}

// ignore: avoid_implementing_value_types
class MockNativeMethod extends Mock implements NativeMethod {}

// ignore: avoid_implementing_value_types
class MockNativeProperty extends Mock implements NativeProperty {}

// ignore: avoid_implementing_value_types
class MockNativeMemberVariable extends Mock implements NativeMemberVariable {}

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final userDefaults = UserDefaults(target);

  void _when<T>(String name, List arguments, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.method(name, arguments: arguments))),
    )).thenAnswer((_) async => result);
  }

  void _whenNoArgs<T>(String name, T result, {isMethod = true}) {
    if (isMethod) {
      _when(name, null, result);
    } else {
      when(channel.invokeMethod<T>(
        'invoke',
        argThat(TargetMatcher(target.memberVariable(name))),
      )).thenAnswer((_) async => result);
    }
  }

  void _whenNoResult(String name, List arguments) => _when<void>(name, arguments, null);

  test('global', () async {
    expect(UserDefaults.standard(), isInstanceOf<UserDefaults>());

    final mockTarget = MockNativeTarget();
    final mockMethod = MockNativeMethod();

    when(mockTarget.method('alloc')).thenAnswer((_) => mockMethod);

    when(mockMethod.method('initWithSuiteName:', arguments: ['test'])).thenAnswer((_) => mockMethod);
    when(mockMethod.keep()).thenAnswer((_) async => true);
    when(mockMethod.dispose()).thenAnswer((_) async => true);

    final defaults = await UserDefaults.named('test', mockTarget);

    expect(defaults, isInstanceOf<UserDefaults>());
    expect(await defaults.dispose(), true);

    when(mockMethod.keep()).thenAnswer((_) async => false);
    expect(await UserDefaults.named('test', mockTarget), null);
  });

  test('boolForKey', () async {
    _when<bool>('boolForKey:', ['1'], true);
    expect(await userDefaults.boolForKey('1'), true);
  });

  test('objectForKey', () async {
    _when<bool>('objectForKey:', ['1'], true);
    expect(await userDefaults.objectForKey<bool>('1'), true);
  });

  test('setBool', () async {
    _whenNoResult('setBool:forKey:', [true, '1']);
    await userDefaults.setBool(value: true, key: '1');
  });

  test('intForKey', () async {
    _when<int>('integerForKey:', ['1'], 1);
    expect(await userDefaults.intForKey('1'), 1);
  });

  test('setInt', () async {
    _whenNoResult('setInteger:forKey:', [1, '1']);
    await userDefaults.setInt(1, '1');
  });

  test('doubleForKey', () async {
    _when<double>('doubleForKey:', ['1'], 0.5);
    expect(await userDefaults.doubleForKey('1'), 0.5);
  });

  test('setDouble', () async {
    _whenNoResult('setDouble:forKey:', [0.5, '1']);
    await userDefaults.setDouble(0.5, '1');
  });

  test('stringForKey', () async {
    _when<String>('stringForKey:', ['1'], 'ok');
    expect(await userDefaults.stringForKey('1'), 'ok');
  });

  test('setString', () async {
    _whenNoResult('setString:forKey:', ['ok', '1']);
    await userDefaults.setString('ok', '1');
  });

  test('setObject', () async {
    _whenNoResult('setObject:forKey:', ['ok', '1']);
    await userDefaults.setObject('ok', '1');
  });

  test('mapForKey', () async {
    _when<Map>('dictionaryForKey:', ['1'], {'1': 'ok'});
    expect(await userDefaults.mapForKey('1'), {'1': 'ok'});
  });

  test('listForKey', () async {
    _when<List>('arrayForKey:', ['1'], ['1']);
    expect(await userDefaults.listForKey('1'), ['1']);
  });

  test('stringListForKey', () async {
    _when<List<String>>('stringArrayForKey:', ['1'], ['1']);
    expect(await userDefaults.stringListForKey('1'), ['1']);
  });

  test('setUri', () async {
    final uri = Uri.file('/d/d/d');
    _whenNoResult('setURL:forKey:', [uri, '1']);
    await userDefaults.setUri(uri, '1');
  });

  test('registerDefaults', () async {
    _whenNoResult('registerDefaults:', [
      {'1': 'ok'}
    ]);
    await userDefaults.registerDefaults({'1': 'ok'});
  });

  test('addSuite', () async {
    _whenNoResult('addSuiteNamed:', ['1']);
    await userDefaults.addSuite('1');
  });

  test('removeSuite', () async {
    _whenNoResult('removeSuiteNamed:', ['1']);
    await userDefaults.removeSuite('1');
  });

  test('representation', () async {
    _whenNoArgs<Map<String, dynamic>>('dictionaryRepresentation', <String, dynamic>{'1': 'ok'});
    expect(await userDefaults.representation, <String, dynamic>{'1': 'ok'});
  });

  test('volatileDomainNames', () async {
    _whenNoArgs<List<String>>('volatileDomainNames', <String>['1']);
    expect(await userDefaults.volatileDomainNames, <String>['1']);
  });

  test('volatileDomainNamed', () async {
    _when<Map<String, dynamic>>('volatileDomainForName:', ['1'], <String, dynamic>{'1': 'ok'});
    expect(await userDefaults.volatileDomainNamed('1'), <String, dynamic>{'1': 'ok'});
  });

  test('setVolatileDomain', () async {
    _whenNoResult('setVolatileDomain:', [
      <String, dynamic>{'1': 'ok'}
    ]);
    await userDefaults.setVolatileDomain(<String, dynamic>{'1': 'ok'}, '1');
  });

  test('removeVolatileDomain', () async {
    _whenNoResult('removeVolatileDomainForName:', ['1']);
    await userDefaults.removeVolatileDomain('1');
  });

  test('persistentDomainNames', () async {
    _whenNoArgs<List<String>>('persistentDomainNames', <String>['1']);
    expect(await userDefaults.persistentDomainNames, <String>['1']);
  });

  test('persistentDomainNamed', () async {
    _when<Map<String, dynamic>>('persistentDomainForName:', <String>['1'], <String, dynamic>{'1': 'ok'});
    expect(await userDefaults.persistentDomainNamed('1'), <String, dynamic>{'1': 'ok'});
  });

  test('setPersistentDomain', () async {
    _whenNoResult('setPersistentDomain:forName:', [
      <String, dynamic>{'1': 'ok'},
      '1'
    ]);
    await userDefaults.setPersistentDomain({'1': 'ok'}, '1');
  });

  test('removePersistentDomain', () async {
    _whenNoResult('removePersistentDomainForName:', ['1']);
    await userDefaults.removePersistentDomain('1');
  });

  test('synchronize', () async {
    _whenNoArgs<bool>('synchronize', true);
    expect(await userDefaults.synchronize(), true);
  });

  test('objectIsForcedForKey', () async {
    _when<bool>('objectIsForcedForKey:inDomain:', ['1', '2'], true);
    expect(await userDefaults.objectIsForcedForKey('1', domain: '2'), true);

    _when<bool>('objectIsForcedForKey:', ['1'], true);
    expect(await userDefaults.objectIsForcedForKey('1'), true);
  });
}
