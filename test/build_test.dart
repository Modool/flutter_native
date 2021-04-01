import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final build = Build(target);

  void _when<T>(String name, List arguments, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.method(name, arguments: arguments))),
    )).thenAnswer((_) async => result);
  }

  void _whenVariable<T>(String name, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.memberVariable(name))),
    )).thenAnswer((_) async => result);
  }

  void _whenNoArgs<T>(String name, T result) => _when<T>(name, null, result);

  group('Build', () {
    test('global', () async {
      expect(Build.system(), isNotNull);
    });

    group('methods', () {
      setUp(() {
        _whenVariable<String>('TAG', 'ok');
        _whenVariable<String>('UNKNOWN', 'ok');
        _whenVariable<String>('ID', 'ok');
        _whenVariable<String>('DISPLAY', 'ok');
        _whenVariable<String>('PRODUCT', 'ok');
        _whenVariable<String>('DEVICE', 'ok');
        _whenVariable<String>('BOARD', 'ok');
        _whenVariable<String>('CPU_ABI', 'ok');
        _whenVariable<String>('CPU_ABI2', 'ok');
        _whenVariable<String>('MANUFACTURER', 'ok');
        _whenVariable<String>('BRAND', 'ok');
        _whenVariable<String>('MODEL', 'ok');
        _whenVariable<String>('BOOTLOADER', 'ok');
        _whenVariable<String>('RADIO', 'ok');
        _whenVariable<String>('HARDWARE', 'ok');
        _whenVariable<bool>('IS_EMULATOR', true);
        _whenNoArgs<String>('getSerial', 'ok');
        _whenVariable<List<String>>('SUPPORTED_ABIS', ['ok']);
        _whenVariable<List<String>>('SUPPORTED_32_BIT_ABIS', ['ok']);
        _whenVariable<List<String>>('SUPPORTED_64_BIT_ABIS', ['ok']);
        _whenVariable<String>('TYPE', 'ok');
        _whenVariable<String>('TAGS', 'ok');
        _whenVariable<String>('FINGERPRINT', 'ok');
        _whenVariable<bool>('IS_TREBLE_ENABLED', true);
        _whenVariable<int>('TIME', 1);
        _whenVariable<String>('USER', 'ok');
        _whenVariable<String>('HOST', 'ok');
        _whenVariable<bool>('IS_DEBUGGABLE', true);
        _whenVariable<bool>('IS_ENG', true);
        _whenVariable<bool>('IS_USERDEBUG', true);
        _whenVariable<bool>('IS_USER', true);
        _whenVariable<bool>('IS_CONTAINER', true);
        _whenVariable<bool>('PERMISSIONS_REVIEW_REQUIRED', true);
        _whenNoArgs<String>('getRadioVersion', 'ok');
      });

      test('variables', () async {
        expect(await build.tag, 'ok');
        expect(await build.unknown, 'ok');
        expect(await build.id, 'ok');
        expect(await build.display, 'ok');
        expect(await build.product, 'ok');
        expect(await build.device, 'ok');
        expect(await build.board, 'ok');
        expect(await build.cpuAbi, 'ok');
        expect(await build.cpuAbi2, 'ok');
        expect(await build.manufacturer, 'ok');
        expect(await build.brand, 'ok');
        expect(await build.model, 'ok');
        expect(await build.bootloader, 'ok');
        expect(await build.radio, 'ok');
        expect(await build.hardware, 'ok');
        expect(await build.isEmulator, true);
        expect(await build.serial, 'ok');
        expect(await build.supportedAbis, ['ok']);
        expect(await build.supported32BitAbis, ['ok']);
        expect(await build.supported64BitAbis, ['ok']);
        expect(await build.type, 'ok');
        expect(await build.tags, 'ok');
        expect(await build.fingerprint, 'ok');
        expect(await build.isTrebleEnabled, true);
        expect(await build.time, 1);
        expect(await build.user, 'ok');
        expect(await build.host, 'ok');
        expect(await build.isDebuggable, true);
        expect(await build.isEnglish, true);
        expect(await build.isUserDebug, true);
        expect(await build.isUser, true);
        expect(await build.isContainer, true);
        expect(await build.isPermissionReviewRequired, true);
        expect(await build.radioVersion, 'ok');
      });
    });

    group('Version', () {
      test('global', () async {
        expect(Version.system(), isNotNull);
      });

      group('methods', () {
        final version = Version(target);
        setUp(() {
          _whenVariable<String>('INCREMENTAL', 'ok');
          _whenVariable<String>('RELEASE', 'ok');
          _whenVariable<String>('BASE_OS', 'ok');
          _whenVariable<String>('SECURITY_PATCH', 'ok');
          _whenVariable<String>('SDK', 'ok');

          _whenVariable<int>('SDK_INT', 1);
          _whenVariable<int>('FIRST_SDK_INT', 1);
          _whenVariable<int>('PREVIEW_SDK_INT', 1);

          _whenVariable<String>('CODENAME', 'ok');

          _whenVariable<List<String>>('ALL_CODENAMES', ['ok']);
          _whenVariable<List<String>>('ACTIVE_CODENAMES', ['ok']);

          _whenVariable<int>('MIN_SUPPORTED_TARGET_SDK_INT', 1);
        });

        test('variables', () async {
          expect(await version.incremental, 'ok');
          expect(await version.release, 'ok');
          expect(await version.baseOperatingSystem, 'ok');
          expect(await version.securityPatch, 'ok');
          expect(await version.sdk, 'ok');

          expect(await version.sdkIntValue, 1);
          expect(await version.firstSdkIntValue, 1);
          expect(await version.previewSdk, 1);

          expect(await version.codeName, 'ok');

          expect(await version.allCodeNames, ['ok']);
          expect(await version.activeCodeNames, ['ok']);

          expect(await version.minSupportedTargetSdk, 1);
        });
      });
    });

    group('Version', () {
      test('global', () async {
        expect(VersionCodes.system(), isNotNull);
      });

      group('methods', () {
        final versionCodes = VersionCodes(target);
        setUp(() {
          _whenVariable<int>('CUR_DEVELOPMENT', 1);
          _whenVariable<int>('BASE', 1);
          _whenVariable<int>('BASE_1_1', 1);
          _whenVariable<int>('CUPCAKE', 1);
          _whenVariable<int>('DONUT', 1);
          _whenVariable<int>('ECLAIR', 1);
          _whenVariable<int>('ECLAIR_0_1', 1);
          _whenVariable<int>('ECLAIR_MR1', 1);
          _whenVariable<int>('FROYO', 1);
          _whenVariable<int>('GINGERBREAD', 1);
          _whenVariable<int>('HONEYCOMB', 1);
          _whenVariable<int>('HONEYCOMB_MR1', 1);
          _whenVariable<int>('HONEYCOMB_MR2', 1);
          _whenVariable<int>('ICE_CREAM_SANDWICH', 1);
          _whenVariable<int>('ICE_CREAM_SANDWICH_MR1', 1);
          _whenVariable<int>('JELLY_BEAN', 1);
          _whenVariable<int>('JELLY_BEAN_MR1', 1);
          _whenVariable<int>('JELLY_BEAN_MR2', 1);
          _whenVariable<int>('KITKAT', 1);
          _whenVariable<int>('KITKAT_WATCH', 1);
          _whenVariable<int>('L', 1);
          _whenVariable<int>('LOLLIPOP', 1);
          _whenVariable<int>('LOLLIPOP_MR1', 1);
          _whenVariable<int>('M', 1);
          _whenVariable<int>('N', 1);
          _whenVariable<int>('N_MR1', 1);
          _whenVariable<int>('O', 1);
          _whenVariable<int>('O_MR1', 1);
          _whenVariable<int>('P', 1);
        });

        test('variables', () async {
          expect(await versionCodes.currentDevelopment, 1);
          expect(await versionCodes.base, 1);
          expect(await versionCodes.base1_1, 1);
          expect(await versionCodes.cupcake, 1);
          expect(await versionCodes.donut, 1);
          expect(await versionCodes.eclair, 1);
          expect(await versionCodes.eclair0_1, 1);
          expect(await versionCodes.eclairMr1, 1);
          expect(await versionCodes.froyo, 1);
          expect(await versionCodes.gingerbread, 1);
          expect(await versionCodes.homeyComb, 1);
          expect(await versionCodes.homeyCombMr1, 1);
          expect(await versionCodes.homeyCombMr2, 1);
          expect(await versionCodes.iceCreamSandwich, 1);
          expect(await versionCodes.iceCreamSandwichMr1, 1);
          expect(await versionCodes.jellyBean, 1);
          expect(await versionCodes.jellyBeanMr1, 1);
          expect(await versionCodes.jellyBeanMr2, 1);
          expect(await versionCodes.kitKat, 1);
          expect(await versionCodes.kitKatWatch, 1);
          expect(await versionCodes.l, 1);
          expect(await versionCodes.lollipop, 1);
          expect(await versionCodes.lollipopMr1, 1);
          expect(await versionCodes.m, 1);
          expect(await versionCodes.n, 1);
          expect(await versionCodes.nMr1, 1);
          expect(await versionCodes.o, 1);
          expect(await versionCodes.oMr1, 1);
          expect(await versionCodes.p, 1);
        });
      });
    });
  });
}
