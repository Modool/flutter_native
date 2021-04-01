import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final assetManager = AssetManager(target);

  void _when<T>(String name, List arguments, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.method(name, arguments: arguments))),
    )).thenAnswer((_) async => result);
  }

  void _whenNoAny<T>(String name) => _when<T>(name, null, null);

  test('global', () async {
    expect(AssetManager.classTarget.isSameAs(runtime.classNamed('android.content.res.AssetManager')), true);

    expect(AssetManager.system(target), isNotNull);
    expect(AssetManager.from(target), isNotNull);
  });

  group('methods', () {
    setUp(() {
      _whenNoAny<void>('ensureValidLocked');
      _whenNoAny<void>('ensureOpenLocked');
    });

    test('ensureValidLocked', () async {
      await assetManager.ensureValidLocked();
    });
    test('ensureOpenLocked', () async {
      await assetManager.ensureOpenLocked();
    });
  });
}
