import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final resources = Resources(target, target);

  void _when<T>(String name, List arguments, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.method(name, arguments: arguments))),
    )).thenAnswer((_) async => result);
  }

  void _whenNoResult(String name, List arguments) => _when<void>(name, arguments, null);

  void _whenNoAny<T>(String name) => _when<T>(name, null, null);

  test('global', () async {
    expect(Resources.system(), isNotNull);
    expect(Resources.from(target), isNotNull);
  });

  test('targets', () async {
    expect(resources.assetManager, isInstanceOf<AssetManager>());
    expect(resources.impl, isInstanceOf<ResourcesImpl>());
    expect(resources.classLoader, isInstanceOf<ClassLoader>());
  });

  group('methods', () {
    setUp(() {
      _when<int>('selectDefaultTheme', [1, 2], 1);
      _when<int>('selectSystemTheme', [1, 2, 3, 4, 5, 6], 1);
      _whenNoResult('preloadFonts', [1]);
      _when<String>('getQuantityText', [1, 2], 'ok');
      _when<String>('getString', [1], 'ok');
      _when<String>('getString', [1, '2'], 'ok');
      _when<String>('getQuantityString', [1, 2, '3'], 'ok');
      _when<String>('getQuantityString', [1, 2], 'ok');
      _when<List<String>>('getStringArray', [1], ['ok']);
      _when<List<int>>('getIntArray', [1], [1]);
      _when<double>('getDimension', [1], 0.5);
      _when<int>('getDimensionPixelOffset', [1], 1);
      _when<int>('getDimensionPixelSize', [1], 1);
      _when<double>('getFraction', [1, 2, 3], 0.5);
      _when<int>('getColor', [1], 1);
      _when<bool>('getBoolean', [1], true);
      _when<int>('getInteger', [1], 1);
      _when<int>('getIdentifier', ['1', '2', '3'], 1);
      _when<bool>('resourceHasPackage', [1], true);
      _when<String>('getResourceName', [1], 'ok');
      _when<String>('getResourcePackageName', [1], 'ok');
      _when<String>('getResourceTypeName', [1], 'ok');
      _when<String>('getResourceEntryName', [1], 'ok');
      _whenNoAny('flushLayoutCache');
      _whenNoAny('startPreloading');
      _whenNoAny('finishPreloading');
    });

    test('selectDefaultTheme 1 2', () async {
      expect(await resources.selectDefaultTheme(1, 2), 1);
    });
    test('selectSystemTheme 1 2 3 4 5 6', () async {
      expect(await resources.selectSystemTheme(1, 2, 3, 4, 5, 6), 1);
    });
    test('preloadFonts 1', () async {
      await resources.preloadFonts(1);
    });
    test('quantityText 1 2', () async {
      expect(await resources.quantityText(1, 2), 'ok');
    });
    test('string 1', () async {
      expect(await resources.string(1), 'ok');
    });
    test('stringWithFromat 1 2', () async {
      expect(await resources.stringWithFromat(1, ['2']), 'ok');
    });
    test('quantityStringWithFromat 1 2 3', () async {
      expect(await resources.quantityStringWithFromat(1, 2, ['3']), 'ok');
    });
    test('getQuantityString 1 2', () async {
      expect(await resources.quantityString(1, 2), 'ok');
    });
    test('stringArray 1', () async {
      expect(await resources.stringArray(1), ['ok']);
    });
    test('intArray 1', () async {
      expect(await resources.intArray(1), [1]);
    });
    test('dimension 1', () async {
      expect(await resources.dimension(1), 0.5);
    });
    test('dimensionPixelOffset 1', () async {
      expect(await resources.dimensionPixelOffset(1), 1);
    });
    test('dimensionPixelSize 1', () async {
      expect(await resources.dimensionPixelSize(1), 1);
    });
    test('fraction 1 2 3', () async {
      expect(await resources.fraction(1, 2, 3), 0.5);
    });
    test('color 1', () async {
      expect(await resources.color(1), 1);
    });
    test('boolean 1', () async {
      expect(await resources.boolean(1), true);
    });
    test('integer 1', () async {
      expect(await resources.integer(1), 1);
    });
    test('dentifier 1 2 3', () async {
      expect(await resources.dentifier('1', '2', '3'), 1);
    });
    test('resourceHasPackage 1', () async {
      expect(await resources.resourceHasPackage(1), true);
    });
    test('resourceName 1', () async {
      expect(await resources.resourceName(1), 'ok');
    });
    test('resourcePackageName 1', () async {
      expect(await resources.resourcePackageName(1), 'ok');
    });
    test('resourceTypeName 1', () async {
      expect(await resources.resourceTypeName(1), 'ok');
    });
    test('resourceEntryName 1', () async {
      expect(await resources.resourceEntryName(1), 'ok');
    });
    test('flushLayoutCache', () async {
      await resources.flushLayoutCache();
    });
    test('startPreloading', () async {
      await resources.startPreloading();
    });
    test('finishPreloading', () async {
      await resources.finishPreloading();
    });
  });
}
