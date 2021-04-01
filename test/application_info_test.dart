import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final info = ApplicationInfo(target, target);

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

  test('global', () async {
    expect(ApplicationInfo.from(target), isNotNull);
  });

  test('targets', () async {
    expect(info.applicationInfo, isNotNull);
  });

  group('properties', () {
    setUp(() {
      _whenNoArgs<String>('taskAffinity', 'ok', isMethod: false);
      _whenNoArgs<String>('permission', 'ok', isMethod: false);
      _whenNoArgs<String>('processName', 'ok', isMethod: false);
      _whenNoArgs<String>('className', 'ok', isMethod: false);
      _whenNoArgs<int>('descriptionRes', 1, isMethod: false);
      _whenNoArgs<int>('theme', 1, isMethod: false);
      _whenNoArgs<String>('manageSpaceActivityName', 'ok', isMethod: false);
      _whenNoArgs<String>('backupAgentName', 'ok', isMethod: false);
      _whenNoArgs<int>('fullBackupContent', 1, isMethod: false);
      _whenNoArgs<int>('uiOptions', 1, isMethod: false);
      _whenNoArgs<int>('privateFlags', 1, isMethod: false);
      _whenNoArgs<int>('requiresSmallestWidthDp', 1, isMethod: false);
      _whenNoArgs<int>('compatibleWidthLimitDp', 1, isMethod: false);
      _whenNoArgs<int>('largestWidthLimitDp', 1, isMethod: false);
      _whenNoArgs<double>('maxAspectRatio', 0.5, isMethod: false);
      _whenNoArgs<String>('volumeUuid', 'ok', isMethod: false);
      _whenNoArgs<String>('scanSourceDir', 'ok', isMethod: false);
      _whenNoArgs<String>('scanPublicSourceDir', 'ok', isMethod: false);
      _whenNoArgs<String>('sourceDir', 'ok', isMethod: false);
      _whenNoArgs<String>('publicSourceDir', 'ok', isMethod: false);
      _whenNoArgs<List<String>>('splitNames', ['ok'], isMethod: false);
      _whenNoArgs<List<String>>('splitSourceDirs', ['ok'], isMethod: false);
      _whenNoArgs<List<String>>('splitPublicSourceDirs', ['ok'], isMethod: false);
      _whenNoArgs<List<String>>('resourceDirs', ['ok'], isMethod: false);
      _whenNoArgs<String>('seInfo', 'ok', isMethod: false);
      _whenNoArgs<String>('seInfoUser', 'ok', isMethod: false);
      _whenNoArgs<List<String>>('sharedLibraryFiles', ['ok'], isMethod: false);
      _whenNoArgs<String>('dataDir', 'ok', isMethod: false);
      _whenNoArgs<String>('deviceProtectedDataDir', 'ok', isMethod: false);
      _whenNoArgs<String>('credentialProtectedDataDir', 'ok', isMethod: false);
      _whenNoArgs<String>('nativeLibraryDir', 'ok', isMethod: false);
      _whenNoArgs<String>('secondaryNativeLibraryDir', 'ok', isMethod: false);
      _whenNoArgs<String>('nativeLibraryRootDir', 'ok', isMethod: false);
      _whenNoArgs<bool>('nativeLibraryRootRequiresIsa', true, isMethod: false);
      _whenNoArgs<String>('primaryCpuAbi', 'ok', isMethod: false);
      _whenNoArgs<String>('secondaryCpuAbi', 'ok', isMethod: false);
      _whenNoArgs<int>('uid', 1, isMethod: false);
      _whenNoArgs<int>('minSdkVersion', 1, isMethod: false);
      _whenNoArgs<int>('targetSdkVersion', 1, isMethod: false);
      _whenNoArgs<int>('longVersionCode', 1, isMethod: false);
      _whenNoArgs<int>('versionCode', 1, isMethod: false);
      _whenNoArgs<int>('compileSdkVersion', 1, isMethod: false);
      _whenNoArgs<String>('compileSdkVersionCodename', 'ok', isMethod: false);
      _whenNoArgs<bool>('enabled', true, isMethod: false);
      _whenNoArgs<int>('enabledSetting', 1, isMethod: false);
      _whenNoArgs<int>('installLocation', 1, isMethod: false);
      _whenNoArgs<int>('networkSecurityConfigRes', 1, isMethod: false);
      _whenNoArgs<int>('targetSandboxVersion', 1, isMethod: false);
      _whenNoArgs<int>('appComponentFactory', 1, isMethod: false);
      _whenNoArgs<int>('category', 1, isMethod: false);
      _whenNoArgs<String>('classLoaderName', 'ok', isMethod: false);
      _whenNoArgs<List<String>>('splitClassLoaderNames', ['ok'], isMethod: false);
      _when<bool>('isValidHiddenApiEnforcementPolicy', [1], true);
      _whenNoArgs<int>('mHiddenApiPolicy', 1, isMethod: false);
      _whenNoArgs<bool>('hasRtlSupport', true);
      _whenNoArgs<bool>('hasCode', true);
      _whenNoAny<void>('disableCompatibilityMode');
      _whenNoArgs<bool>('usesCompatibilityMode', true);
      _whenNoResult('initForUser', [1]);
      _whenNoArgs<bool>('isPackageWhitelistedForHiddenApis', true);
      _whenNoArgs<bool>('isAllowedToUseHiddenApis', true);
      _whenNoArgs<int>('getHiddenApiEnforcementPolicy', 1);
      _whenNoResult('setHiddenApiEnforcementPolicy', [1]);
      _whenNoAny<void>('maybeUpdateHiddenApiEnforcementPolicy');
      _whenNoResult('setVersionCode', [1]);
      _whenNoArgs<bool>('isDefaultToDeviceProtectedStorage', true);
      _whenNoArgs<bool>('isDirectBootAware', true);
      _whenNoArgs<bool>('isEncryptionAware', true);
      _whenNoArgs<bool>('isExternal', true);
      _whenNoArgs<bool>('isExternalAsec', true);
      _whenNoArgs<bool>('isForwardLocked', true);
      _whenNoArgs<bool>('isInstantApp', true);
      _whenNoArgs<bool>('isInternal', true);
      _whenNoArgs<bool>('isOem', true);
      _whenNoArgs<bool>('isPartiallyDirectBootAware', true);
      _whenNoArgs<bool>('isSignedWithPlatformKey', true);
      _whenNoArgs<bool>('isPrivilegedApp', true);
      _whenNoArgs<bool>('isRequiredForSystemUser', true);
      _whenNoArgs<bool>('isStaticSharedLibrary', true);
      _whenNoArgs<bool>('isSystemApp', true);
      _whenNoArgs<bool>('isUpdatedSystemApp', true);
      _whenNoArgs<bool>('isVendor', true);
      _whenNoArgs<bool>('isProduct', true);
      _whenNoArgs<bool>('isVirtualPreload', true);
      _whenNoArgs<bool>('requestsIsolatedSplitLoading', true);
      _whenNoResult('setCodePath', ['1']);
      _whenNoResult('setBaseCodePath', ['1']);
      _whenNoResult('setSplitCodePaths', [
        ['1']
      ]);
      _whenNoResult('setResourcePath', ['1']);
      _whenNoResult('setBaseResourcePath', ['1']);
      _whenNoResult('setSplitResourcePaths', [
        ['1']
      ]);
      _whenNoArgs<String>('getCodePath', '1');
      _whenNoArgs<String>('getBaseCodePath', '1');
      _whenNoArgs<List<String>>('getSplitCodePaths', ['1']);
      _whenNoArgs<String>('getResourcePath', '1');
      _whenNoArgs<String>('getBaseResourcePath', '1');
      _whenNoArgs<List<String>>('getSplitResourcePaths', ['1']);
    });

    test('get taskAffinity', () async {
      expect(await info.taskAffinity, 'ok');
    });
    test('get permission', () async {
      expect(await info.permission, 'ok');
    });
    test('get processName', () async {
      expect(await info.processName, 'ok');
    });
    test('get className', () async {
      expect(await info.className, 'ok');
    });
    test('get descriptionRes', () async {
      expect(await info.descriptionRes, 1);
    });
    test('get theme', () async {
      expect(await info.theme, 1);
    });
    test('get manageSpaceActivityName', () async {
      expect(await info.manageSpaceActivityName, 'ok');
    });
    test('get backupAgentName', () async {
      expect(await info.backupAgentName, 'ok');
    });
    test('get fullBackupContent', () async {
      expect(await info.fullBackupContent, 1);
    });
    test('get uiOptions', () async {
      expect(await info.uiOptions, 1);
    });
    test('get privateFlags', () async {
      expect(await info.privateFlags, 1);
    });
    test('get requiresSmallestWidthDp', () async {
      expect(await info.requiresSmallestWidthDp, 1);
    });
    test('get compatibleWidthLimitDp', () async {
      expect(await info.compatibleWidthLimitDp, 1);
    });
    test('get largestWidthLimitDp', () async {
      expect(await info.largestWidthLimitDp, 1);
    });
    test('get maxAspectRatio', () async {
      expect(await info.maxAspectRatio, 0.5);
    });
    test('get volumeUuid', () async {
      expect(await info.volumeUuid, 'ok');
    });
    test('get scanSourceDir', () async {
      expect(await info.scanSourceDir, 'ok');
    });
    test('get scanPublicSourceDir', () async {
      expect(await info.scanPublicSourceDir, 'ok');
    });
    test('get sourceDir', () async {
      expect(await info.sourceDir, 'ok');
    });
    test('get publicSourceDir', () async {
      expect(await info.publicSourceDir, 'ok');
    });
    test('get splitNames', () async {
      expect(await info.splitNames, ['ok']);
    });
    test('get splitSourceDirs', () async {
      expect(await info.splitSourceDirs, ['ok']);
    });
    test('get splitPublicSourceDirs', () async {
      expect(await info.splitPublicSourceDirs, ['ok']);
    });
    test('get resourceDirs', () async {
      expect(await info.resourceDirs, ['ok']);
    });
    test('get seInfo', () async {
      expect(await info.seInfo, 'ok');
    });
    test('get seInfoUser', () async {
      expect(await info.seInfoUser, 'ok');
    });
    test('get sharedLibraryFiles', () async {
      expect(await info.sharedLibraryFiles, ['ok']);
    });
    test('get dataDir', () async {
      expect(await info.dataDir, 'ok');
    });
    test('get deviceProtectedDataDir', () async {
      expect(await info.deviceProtectedDataDir, 'ok');
    });
    test('get credentialProtectedDataDir', () async {
      expect(await info.credentialProtectedDataDir, 'ok');
    });
    test('get nativeLibraryDir', () async {
      expect(await info.nativeLibraryDir, 'ok');
    });
    test('get secondaryNativeLibraryDir', () async {
      expect(await info.secondaryNativeLibraryDir, 'ok');
    });
    test('get nativeLibraryRootDir', () async {
      expect(await info.nativeLibraryRootDir, 'ok');
    });
    test('get nativeLibraryRootRequiresIsa', () async {
      expect(await info.nativeLibraryRootRequiresIsa, true);
    });
    test('get primaryCpuAbi', () async {
      expect(await info.primaryCpuAbi, 'ok');
    });
    test('get secondaryCpuAbi', () async {
      expect(await info.secondaryCpuAbi, 'ok');
    });
    test('get uid', () async {
      expect(await info.uid, 1);
    });
    test('get minSdkVersion', () async {
      expect(await info.minSdkVersion, 1);
    });
    test('get targetSdkVersion', () async {
      expect(await info.targetSdkVersion, 1);
    });
    test('get longVersionCode', () async {
      expect(await info.longVersionCode, 1);
    });
    test('get versionCode', () async {
      expect(await info.versionCode, 1);
    });
    test('get compileSdkVersion', () async {
      expect(await info.compileSdkVersion, 1);
    });
    test('get compileSdkVersionCodename', () async {
      expect(await info.compileSdkVersionCodename, 'ok');
    });
    test('get enabled', () async {
      expect(await info.enabled, true);
    });
    test('get enabledSetting', () async {
      expect(await info.enabledSetting, 1);
    });
    test('get installLocation', () async {
      expect(await info.installLocation, 1);
    });
    test('get networkSecurityConfigRes', () async {
      expect(await info.networkSecurityConfigRes, 1);
    });
    test('get targetSandboxVersion', () async {
      expect(await info.targetSandboxVersion, 1);
    });
    test('get appComponentFactory', () async {
      expect(await info.appComponentFactory, 1);
    });
    test('get category', () async {
      expect(await info.category, 1);
    });
    test('get classLoaderName', () async {
      expect(await info.classLoaderName, 'ok');
    });
    test('get splitClassLoaderNames', () async {
      expect(await info.splitClassLoaderNames, ['ok']);
    });
    test('get isValidHiddenApiEnforcementPolicy', () async {
      expect(await info.isValidHiddenApiEnforcementPolicy(1), true);
    });
    test('get mHiddenApiPolicy', () async {
      expect(await info.mHiddenApiPolicy, 1);
    });
    test('get hasRtlSupport', () async {
      expect(await info.hasRtlSupport, true);
    });
    test('get hasCode', () async {
      expect(await info.hasCode, true);
    });
    test('disableCompatibilityMode', () async {
      await info.disableCompatibilityMode();
    });
    test('get usesCompatibilityMode', () async {
      expect(await info.usesCompatibilityMode, true);
    });
    test('initForUser', () async {
      await info.initForUser(1);
    });
    test('get packageWhitelistedForHiddenApis', () async {
      expect(await info.packageWhitelistedForHiddenApis, true);
    });
    test('get allowedToUseHiddenApis', () async {
      expect(await info.allowedToUseHiddenApis, true);
    });
    test('get hiddenApiEnforcementPolicy', () async {
      expect(await info.hiddenApiEnforcementPolicy, 1);
    });
    test('setHiddenApiEnforcementPolicy', () async {
      await info.setHiddenApiEnforcementPolicy(1);
    });
    test('maybeUpdateHiddenApiEnforcementPolicy', () async {
      await info.maybeUpdateHiddenApiEnforcementPolicy();
    });
    test('setVersionCode', () async {
      await info.setVersionCode(1);
    });
    test('get isDefaultToDeviceProtectedStorage', () async {
      expect(await info.isDefaultToDeviceProtectedStorage, true);
    });
    test('get isDirectBootAware', () async {
      expect(await info.isDirectBootAware, true);
    });
    test('get isEncryptionAware', () async {
      expect(await info.isEncryptionAware, true);
    });
    test('get isExternal', () async {
      expect(await info.isExternal, true);
    });
    test('get isExternalAsec', () async {
      expect(await info.isExternalAsec, true);
    });
    test('get isForwardLocked', () async {
      expect(await info.isForwardLocked, true);
    });
    test('get isInstantApp', () async {
      expect(await info.isInstantApp, true);
    });
    test('get isInternal', () async {
      expect(await info.isInternal, true);
    });
    test('get isOem', () async {
      expect(await info.isOem, true);
    });
    test('get isPartiallyDirectBootAware', () async {
      expect(await info.isPartiallyDirectBootAware, true);
    });
    test('get isSignedWithPlatformKey', () async {
      expect(await info.isSignedWithPlatformKey, true);
    });
    test('get isPrivilegedApp', () async {
      expect(await info.isPrivilegedApp, true);
    });
    test('get isRequiredForSystemUser', () async {
      expect(await info.isRequiredForSystemUser, true);
    });
    test('get isStaticSharedLibrary', () async {
      expect(await info.isStaticSharedLibrary, true);
    });
    test('get isSystemApp', () async {
      expect(await info.isSystemApp, true);
    });
    test('get isUpdatedSystemApp', () async {
      expect(await info.isUpdatedSystemApp, true);
    });
    test('get isVendor', () async {
      expect(await info.isVendor, true);
    });
    test('get isProduct', () async {
      expect(await info.isProduct, true);
    });
    test('get isVirtualPreload', () async {
      expect(await info.isVirtualPreload, true);
    });
    test('get requestsIsolatedSplitLoading', () async {
      expect(await info.requestsIsolatedSplitLoading(), true);
    });

    test('setCodePath', () async {
      await info.setCodePath('1');
    });
    test('setBaseCodePath', () async {
      await info.setBaseCodePath('1');
    });
    test('setSplitCodePaths', () async {
      await info.setSplitCodePaths(['1']);
    });
    test('setResourcePath', () async {
      await info.setResourcePath('1');
    });
    test('setBaseResourcePath', () async {
      await info.setBaseResourcePath('1');
    });
    test('setSplitResourcePaths', () async {
      await info.setSplitResourcePaths(['1']);
    });
    test('get codePath', () async {
      expect(await info.codePath, '1');
    });
    test('get baseCodePath', () async {
      expect(await info.baseCodePath, '1');
    });
    test('get splitCodePaths', () async {
      expect(await info.splitCodePaths, ['1']);
    });
    test('get resourcePath', () async {
      expect(await info.resourcePath, '1');
    });
    test('get baseResourcePath', () async {
      expect(await info.baseResourcePath, '1');
    });
    test('get splitResourcePaths', () async {
      expect(await info.splitResourcePaths, ['1']);
    });
  });
}
