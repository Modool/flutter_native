import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  test('global', () async {
    expect(Context.global(), isNotNull);
  });

  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final context = Context(target);

  NativeTarget _target(String name, List arguments) => NativeTarget(name, NativeTargetType.method, target, runtime, arguments: arguments);

  NativeTarget _targetNoArgs(String name) => _target(name, null);

  void _when<T>(String name, List arguments, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.method(name, arguments: arguments))),
    )).thenAnswer((_) async => result);
  }

  void _whenNoResult(String name, List arguments) => _when<void>(name, arguments, null);
  void _whenNoArgs<T>(String name, T result, {isMethod = true}) {
    if (isMethod) {
      _when<T>(name, null, result);
    } else {
      when(channel.invokeMethod<T>(
        'invoke',
        argThat(TargetMatcher(target.memberVariable(name))),
      )).thenAnswer((_) async => result);
    }
  }

  void _whenNoAny<T>(String name) => _when<T>(name, null, null);

  test('targets', () async {
    expect(context.assets, isInstanceOf<AssetManager>());
    expect(context.resources, isInstanceOf<Resources>());

    expect(context.packageManager.isSameAs(_targetNoArgs('getPackageManager')), true);
    expect(context.contentResolver.isSameAs(_targetNoArgs('getContentResolver')), true);
    expect(context.mainLooper.isSameAs(_targetNoArgs('getMainLooper')), true);
    expect(context.mainExecutor.isSameAs(_targetNoArgs('getMainExecutor')), true);
    expect(context.applicationContext.isSameAs(_targetNoArgs('getApplicationContext')), true);
    expect(context.drawable(1).isSameAs(_target('getDrawable', [1])), true);
    expect(context.colorStateList(1).isSameAs(_target('getColorStateList', [1])), true);
    expect(context.theme.isSameAs(_targetNoArgs('getTheme')), true);
    expect(context.classLoader.isSameAs(_targetNoArgs('getClassLoader')), true);
    expect(context.sharedPrefsFile('1').isSameAs(_target('getSharedPrefsFile', ['1'])), true);
    expect(context.databasePath('1').isSameAs(_target('getDatabasePath', ['1'])), true);
    expect(context.dataDir.isSameAs(_targetNoArgs('getDataDir')), true);
    expect(context.filesDir.isSameAs(_targetNoArgs('getFilesDir')), true);
    expect(context.noBackupFilesDir.isSameAs(_targetNoArgs('getNoBackupFilesDir')), true);
    expect(context.externalFilesDir('1').isSameAs(_target('getExternalFilesDir', ['1'])), true);
    expect(context.externalFilesDirs('1').isSameAs(_target('getExternalFilesDirs', ['1'])), true);
    expect(context.obbDir.isSameAs(_targetNoArgs('getObbDir')), true);
    expect(context.obbDirs.isSameAs(_targetNoArgs('getObbDirs')), true);
    expect(context.cacheDir.isSameAs(_targetNoArgs('getCacheDir')), true);
    expect(context.codeCacheDir.isSameAs(_targetNoArgs('getCodeCacheDir')), true);
    expect(context.externalCacheDir.isSameAs(_targetNoArgs('getExternalCacheDir')), true);
    expect(context.preloadsFileCache.isSameAs(_targetNoArgs('getPreloadsFileCache')), true);
    expect(context.externalCacheDirs.isSameAs(_targetNoArgs('getExternalCacheDirs')), true);
    expect(context.externalMediaDirs.isSameAs(_targetNoArgs('getExternalMediaDirs')), true);
    expect(context.wallpaper.isSameAs(_targetNoArgs('getWallpaper')), true);
    expect(context.peekWallpaper.isSameAs(_targetNoArgs('peekWallpaper')), true);
    expect(context.systemService('1').isSameAs(_target('getSystemService', [1])), true);
    expect(context.displayAdjustments(1).isSameAs(_target('getDisplayAdjustments', [1])), true);
    expect(context.display.isSameAs(_targetNoArgs('getDisplay')), true);
    expect(context.activityToken.isSameAs(_targetNoArgs('getActivityToken')), true);
  });

  group('methods', () {
    final uri = Uri(host: 'www.bilibili.com');

    setUp(() {
      _when<String>('getText', [1], 'ok');
      _when<String>('getString', [1], 'ok');
      _when<String>('getString', [1, 'format'], 'ok');
      _when<int>('getColor', [1], 1);
      _whenNoResult('setTheme', [1]);
      _whenNoArgs<int>('getThemeResId', 1);
      _whenNoArgs<String>('getPackageName', 'ok');
      _whenNoArgs<String>('getBasePackageName', 'ok');
      _whenNoArgs<String>('getOpPackageName', 'ok');
      _whenNoArgs<String>('getPackageResourcePath', 'ok');
      _whenNoArgs<String>('getPackageCodePath', 'ok');
      _when<bool>('deleteSharedPreferences', ['1'], true);
      _whenNoAny<void>('reloadSharedPreferences');
      _when<bool>('deleteFile', ['1'], true);
      _whenNoArgs<List<String>>('fileList', <String>['1']);
      _when<bool>('deleteDatabase', ['1'], true);
      _whenNoArgs<List<String>>('databaseList', ['1']);
      _whenNoArgs<int>('getWallpaperDesiredMinimumWidth', 1);
      _whenNoArgs<int>('getWallpaperDesiredMinimumHeight', 1);
      _whenNoArgs<void>('clearWallpaper', null);
      _whenNoArgs<bool>('canStartActivityForResult', true);
      _when<int>('checkPermission', ['1', 1, 1], 1);
      _when<int>('checkCallingPermission', ['1'], 1);
      _when<int>('checkCallingOrSelfPermission', ['1'], 1);
      _when<int>('checkSelfPermission', ['1'], 1);
      _whenNoResult('enforcePermission', ['1', 1, 1, '1']);
      _whenNoResult('enforceCallingPermission', ['1', '1']);
      _whenNoResult('enforceCallingOrSelfPermission', ['1', '1']);
      _whenNoResult('grantUriPermission', ['1', uri, 1]);
      _whenNoResult('grantUriPermission', ['1', 1, uri]);
      _when<int>('checkCallingUriPermission', [uri, 1], 1);
      _when<int>('checkCallingOrSelfUriPermission', [uri, 1], 1);
      _when<int>('checkUriPermission', [uri, '1', '2', 1, 1, 1], 1);
      _whenNoResult('enforceCallingUriPermission', [uri, 1, '1']);
      _whenNoResult('enforceCallingOrSelfUriPermission', [uri, 1, '1']);
      _whenNoResult('enforceUriPermission', [uri, '2', '3', 1, 1, 1, '1']);
      _whenNoArgs<int>('getUserId', 1);
      _whenNoResult('updateDisplay', [1]);
      _whenNoArgs<bool>('isRestricted', true);
      _whenNoArgs<bool>('isDeviceProtectedStorage', true);
      _whenNoArgs<bool>('isCredentialProtectedStorage', true);
      _whenNoArgs<bool>('canLoadUnsafeResources', true);
      _whenNoArgs<bool>('isAutofillCompatibilityEnabled', true);
      _whenNoResult('setAutofillCompatibilityEnabled', [true]);
      _whenNoAny<void>('assertRuntimeOverlayThemable');
    });

    test('get text', () async {
      expect(await context.text(1), 'ok');
    });

    test('get string', () async {
      expect(await context.string(1), 'ok');
    });

    test('get text with format', () async {
      expect(await context.stringWithFromat(1, <String>['format']), 'ok');
    });

    test('get color', () async {
      expect(await context.color(1), 1);
    });

    test('set theme', () async {
      await context.setTheme(1);
    });

    test('get theme by id', () async {
      expect(await context.themeResId(), 1);
    });

    test('get package name', () async {
      expect(await context.packageName, 'ok');
    });

    test('get base package name', () async {
      expect(await context.basePackageName, 'ok');
    });

    test('get op package name', () async {
      expect(await context.opPackageName, 'ok');
    });

    test('get applicationInfo', () async {
      expect(context.applicationInfo, isInstanceOf<ApplicationInfo>());
    });

    test('get packageResourcePath', () async {
      expect(await context.packageResourcePath, 'ok');
    });

    test('get packageCodePath', () async {
      expect(await context.packageCodePath, 'ok');
    });

    test('get sharedPreferences', () async {
      expect(context.sharedPreferences('1', 1), isInstanceOf<SharedPreferences>());
    });

    test('deleteSharedPreferences', () async {
      expect(await context.deleteSharedPreferences('1'), true);
    });

    test('reloadSharedPreferences', () async {
      await context.reloadSharedPreferences();
    });

    test(' deleteFile 1', () async {
      expect(await context.deleteFile('1'), true);
    });

    test('fileList', () async {
      expect(await context.fileList, <String>['1']);
    });

    test('deleteDatabase', () async {
      expect(await context.deleteDatabase('1'), true);
    });

    test('databaseList', () async {
      expect(await context.databaseList, ['1']);
    });

    test('wallpaperDesiredMinimumWidth', () async {
      expect(await context.wallpaperDesiredMinimumWidth, 1);
    });

    test('wallpaperDesiredMinimumHeight', () async {
      expect(await context.wallpaperDesiredMinimumHeight, 1);
    });

    test('clearWallpaper', () async {
      await context.clearWallpaper();
    });

    test('canStartActivityForResult', () async {
      expect(await context.canStartActivityForResult, true);
    });

    test('checkPermission', () async {
      expect(await context.checkPermission('1', 1, 1), 1);
    });

    test('checkCallingPermission', () async {
      expect(await context.checkCallingPermission('1'), 1);
    });

    test('checkCallingOrSelfPermission', () async {
      expect(await context.checkCallingOrSelfPermission('1'), 1);
    });

    test('checkSelfPermission', () async {
      expect(await context.checkSelfPermission('1'), 1);
    });

    test('enforcePermission', () async {
      await context.enforcePermission('1', 1, 1, '1');
    });

    test('enforceCallingPermission', () async {
      await context.enforceCallingPermission('1', '1');
    });

    test('enforceCallingOrSelfPermission', () async {
      await context.enforceCallingOrSelfPermission('1', '1');
    });

    test('grantUriPermission', () async {
      await context.grantUriPermission('1', uri, 1);
    });

    test('revokeUriPermission', () async {
      await context.revokeUriPermission('1', 1, uri: uri);
    });

    test('checkCallingUriPermission', () async {
      expect(await context.checkCallingUriPermission(uri, 1), 1);
    });

    test('checkCallingOrSelfUriPermission', () async {
      expect(await context.checkCallingOrSelfUriPermission(uri, 1), 1);
    });

    test('checkUriPermission', () async {
      expect(await context.checkUriPermission(uri, 1, 1, 1, readPermission: '1', writePermission: '2'), 1);
    });

    test('enforceCallingUriPermission', () async {
      await context.enforceCallingUriPermission(uri, 1, '1');
    });

    test('enforceCallingOrSelfUriPermission', () async {
      await context.enforceCallingOrSelfUriPermission(uri, 1, '1');
    });

    test('enforceUriPermission', () async {
      await context.enforceUriPermission(uri, 1, 1, 1, '1', readPermission: '2', writePermission: '3');
    });

    test('updateDisplay', () async {
      await context.updateDisplay(1);
    });

    test('userId', () async {
      expect(await context.userId, 1);
    });

    test('restricted', () async {
      expect(await context.restricted, true);
    });

    test('deviceProtectedStorage', () async {
      expect(await context.deviceProtectedStorage, true);
    });

    test('credentialProtectedStorage', () async {
      expect(await context.credentialProtectedStorage, true);
    });

    test('canLoadUnsafeResources', () async {
      expect(await context.canLoadUnsafeResources, true);
    });

    test('autofillCompatibilityEnabled', () async {
      expect(await context.autofillCompatibilityEnabled, true);
    });

    test('setAutofillCompatibilityEnabled', () async {
      await context.setAutofillCompatibilityEnabled(autofillCompatEnabled: true);
    });

    test('assertRuntimeOverlayThemable', () async {
      await context.assertRuntimeOverlayThemable();
    });
  });
}
