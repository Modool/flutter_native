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
  final sharedPreferences = SharedPreferences(target);

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

  test('global', () async {
    expect(AssetManager.system(target), isNotNull);
    expect(AssetManager.from(target), isNotNull);

    final mockTarget = MockNativeTarget();

    when(mockTarget.keep()).thenAnswer((_) async => true);
    when(mockTarget.dispose()).thenAnswer((_) async => true);

    final defaults = await SharedPreferences.keep(mockTarget);
    expect(defaults, isInstanceOf<SharedPreferences>());
    expect(await defaults.dispose(), true);

    when(mockTarget.keep()).thenAnswer((_) async => false);
    expect(await SharedPreferences.keep(mockTarget), null);
  });

  group('shared preference methods', () {
    setUp(() {
      _whenNoArgs<Map<String, dynamic>>('getAll', {'1': 2});
      _when<String>('getString', ['1', '2'], 'ok');
      _when<List<String>>(
        'getStringSet',
        [
          '1',
          ['2']
        ],
        ['ok'],
      );
      _when<int>('getLong', ['1', 2], 1);
      _when<double>('getFloat', ['1', 0.5], 0.5);
      _when<bool>('getBoolean', ['1', true], true);
      _when<bool>('contains', ['1'], true);
    });

    test('all', () async {
      expect(await sharedPreferences.all, {'1': 2});
    });
    test('string', () async {
      expect(await sharedPreferences.string('1', '2'), 'ok');
    });
    test('stringList', () async {
      expect(await sharedPreferences.stringList('1', ['2']), ['ok']);
    });
    test('getInt', () async {
      expect(await sharedPreferences.getInt('1', 2), 1);
    });
    test('getFloat', () async {
      expect(await sharedPreferences.getFloat('1', 0.5), 0.5);
    });
    test('getBool', () async {
      expect(await sharedPreferences.getBool('1', defValue: true), true);
    });
    test('contains', () async {
      expect(await sharedPreferences.contains('1'), true);
    });

    test('contains', () async {
      expect(sharedPreferences.edit, isInstanceOf<Editor>());
    });
  });

  group('editor methods', () {
    final editor = sharedPreferences.edit;

    void _when(String name, List arguments) {
      when(channel.invokeMethod<bool>(
        'invoke',
        argThat(TargetMatcher(
          target.method('edit').method(name, arguments: arguments).method('commit'),
        )),
      )).thenAnswer((_) async => true);
    }

    setUp(() {
      _whenNoArgs<bool>('commit', true);

      _when('putString', ['1', '2']);
      _when('putStringList', [
        '1',
        ['2']
      ]);
      _when('putInt', ['1', 2]);
      _when('putFloat', ['1', 0.5]);
      _when('putBool', ['1', true]);
      _when('remove', ['1']);

      when(channel.invokeMethod<bool>(
        'invoke',
        argThat(TargetMatcher(
          target.method('edit').method('commit'),
        )),
      )).thenAnswer((_) async => true);

      when(channel.invokeMethod<void>(
        'invoke',
        argThat(TargetMatcher(
          target.method('edit').method('apply'),
        )),
      )).thenAnswer((_) async => null);
    });

    test('putString', () async {
      expect(editor.putString('1', '2'), isInstanceOf<Editor>());
      expect(await editor.commit(), true);
    });

    test('putStringList', () async {
      expect(editor.putStringList('1', ['2']), isInstanceOf<Editor>());
      expect(await editor.commit(), true);
    });

    test('putInt', () async {
      expect(editor.putInt('1', 2), isInstanceOf<Editor>());
      expect(await editor.commit(), true);
    });

    test('putFloat', () async {
      expect(editor.putFloat('1', 0.5), isInstanceOf<Editor>());
      expect(await editor.commit(), true);
    });

    test('putBool', () async {
      expect(editor.putBool('1', value: true), isInstanceOf<Editor>());
      expect(await editor.commit(), true);
    });

    test('remove', () async {
      expect(editor.remove('1'), isInstanceOf<Editor>());
      expect(await editor.commit(), true);
    });

    test('clear', () async {
      expect(editor.clear(), isInstanceOf<Editor>());
      expect(await editor.commit(), true);
    });

    test('commit', () async {
      expect(await editor.commit(), true);
    });

    test('apply', () async {
      await editor.apply();
    });
  });
}
