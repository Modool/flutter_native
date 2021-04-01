import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final classLoader = ClassLoader(target, target);

  test('global', () async {
    expect(ClassLoader.from(target), isNotNull);
  });

  group('methods', () {
    setUp(() {
      when(channel.invokeMethod<String>(
        'invoke',
        argThat(TargetMatcher(target.method('getResource', arguments: ['1']).method('toString'))),
      )).thenAnswer((_) async => 'ok');
      when(channel.invokeMethod<bool>(
        'invoke',
        argThat(TargetMatcher(target.method('registerAsParallelCapable'))),
      )).thenAnswer((_) async => true);
    });

    test('registerAsParallelCapable', () async {
      expect(await classLoader.registerAsParallelCapable, true);
    });

    test('resource', () async {
      expect(await classLoader.resource('1'), 'ok');
    });
  });
}
