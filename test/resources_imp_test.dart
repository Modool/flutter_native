import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final resourcesImpl = ResourcesImpl(target, target);

  test('global', () async {
    expect(ResourcesImpl.from(target), isNotNull);
  });

  group('methods', () {
    setUp(() {
      when(channel.invokeMethod<int>(
        'invoke',
        argThat(TargetMatcher(target.method('attrForQuantityCode', arguments: ['1']))),
      )).thenAnswer((_) async => 1);
    });

    test('asset', () async {
      expect(resourcesImpl.assets, isInstanceOf<AssetManager>());
    });
    test('attrForQuantityCode', () async {
      expect(await resourcesImpl.attrForQuantityCode('1'), 1);
    });
  });
}
