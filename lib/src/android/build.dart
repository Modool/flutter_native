import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class Build {
  Build(this._classTarget);

  factory Build.system() => Build(classTarget);

  static final classTarget = NativeRuntime().classNamed('android.os.Build');

  final NativeTarget _classTarget;

  Future<String> get tag => _classTarget.memberVariable('TAG').get<String>();

  Future<String> get unknown =>
      _classTarget.memberVariable('UNKNOWN').get<String>();

  Future<String> get id => _classTarget.memberVariable('ID').get<String>();

  Future<String> get display =>
      _classTarget.memberVariable('DISPLAY').get<String>();

  Future<String> get product =>
      _classTarget.memberVariable('PRODUCT').get<String>();

  Future<String> get device =>
      _classTarget.memberVariable('DEVICE').get<String>();

  Future<String> get board =>
      _classTarget.memberVariable('BOARD').get<String>();

  Future<String> get cpuAbi =>
      _classTarget.memberVariable('CPU_ABI').get<String>();

  Future<String> get cpuAbi2 =>
      _classTarget.memberVariable('CPU_ABI2').get<String>();

  Future<String> get manufacturer =>
      _classTarget.memberVariable('MANUFACTURER').get<String>();

  Future<String> get brand =>
      _classTarget.memberVariable('BRAND').get<String>();

  Future<String> get model =>
      _classTarget.memberVariable('MODEL').get<String>();

  Future<String> get bootloader =>
      _classTarget.memberVariable('BOOTLOADER').get<String>();

  Future<String> get radio =>
      _classTarget.memberVariable('RADIO').get<String>();

  Future<String> get hardware =>
      _classTarget.memberVariable('HARDWARE').get<String>();

  Future<bool> get isEmulator =>
      _classTarget.memberVariable('IS_EMULATOR').get<bool>();

  Future<String> get serial =>
      _classTarget.method('getSerial').invoke<String>();

  Future<List<String>> get supportedAbis =>
      _classTarget.memberVariable('SUPPORTED_ABIS').get<List<String>>();

  Future<List<String>> get supported32BitAbis =>
      _classTarget.memberVariable('SUPPORTED_32_BIT_ABIS').get<List<String>>();

  Future<List<String>> get supported64BitAbis =>
      _classTarget.memberVariable('SUPPORTED_64_BIT_ABIS').get<List<String>>();

  Future<String> get type => _classTarget.memberVariable('TYPE').get<String>();

  Future<String> get tags => _classTarget.memberVariable('TAGS').get<String>();

  Future<String> get fingerprint =>
      _classTarget.memberVariable('FINGERPRINT').get<String>();

  Future<bool> get isTrebleEnabled =>
      _classTarget.memberVariable('IS_TREBLE_ENABLED').get<bool>();

  Future<int> get time => _classTarget.memberVariable('TIME').get<int>();

  Future<String> get user => _classTarget.memberVariable('USER').get<String>();

  Future<String> get host => _classTarget.memberVariable('HOST').get<String>();

  Future<bool> get isDebuggable =>
      _classTarget.memberVariable('IS_DEBUGGABLE').get<bool>();

  Future<bool> get isEnglish =>
      _classTarget.memberVariable('IS_ENG').get<bool>();

  Future<bool> get isUserDebug =>
      _classTarget.memberVariable('IS_USERDEBUG').get<bool>();

  Future<bool> get isUser => _classTarget.memberVariable('IS_USER').get<bool>();

  Future<bool> get isContainer =>
      _classTarget.memberVariable('IS_CONTAINER').get<bool>();

  Future<bool> get isPermissionReviewRequired =>
      _classTarget.memberVariable('PERMISSIONS_REVIEW_REQUIRED').get<bool>();

  Future<String> get radioVersion =>
      _classTarget.method('getRadioVersion').invoke<String>();
}

class Version {
  Version(this._classTarget);

  factory Version.system() => Version(classTarget);

  static final classTarget =
      NativeRuntime().classNamed('android.os.Build.VERSION');

  final NativeTarget _classTarget;

  Future<String> get incremental =>
      _classTarget.memberVariable('INCREMENTAL').get<String>();

  Future<String> get release =>
      _classTarget.memberVariable('RELEASE').get<String>();

  Future<String> get baseOperatingSystem =>
      _classTarget.memberVariable('BASE_OS').get<String>();

  Future<String> get securityPatch =>
      _classTarget.memberVariable('SECURITY_PATCH').get<String>();

  Future<String> get sdk => _classTarget.memberVariable('SDK').get<String>();

  Future<int> get sdkIntValue =>
      _classTarget.memberVariable('SDK_INT').get<int>();

  Future<int> get firstSdkIntValue =>
      _classTarget.memberVariable('FIRST_SDK_INT').get<int>();

  Future<int> get previewSdk =>
      _classTarget.memberVariable('PREVIEW_SDK_INT').get<int>();

  Future<String> get codeName =>
      _classTarget.memberVariable('CODENAME').get<String>();

  Future<List<String>> get allCodeNames =>
      _classTarget.memberVariable('ALL_CODENAMES').get<List<String>>();

  Future<List<String>> get activeCodeNames =>
      _classTarget.memberVariable('ACTIVE_CODENAMES').get<List<String>>();

  Future<int> get minSupportedTargetSdk =>
      _classTarget.memberVariable('MIN_SUPPORTED_TARGET_SDK_INT').get<int>();
}

class VersionCodes {
  VersionCodes(this._classTarget);

  factory VersionCodes.system() => VersionCodes(classTarget);

  static final classTarget =
      NativeRuntime().classNamed('android.os.Build.VERSION_CODES');

  final NativeTarget _classTarget;

  Future<int> get currentDevelopment =>
      _classTarget.memberVariable('CUR_DEVELOPMENT').get<int>();

  Future<int> get base => _classTarget.memberVariable('BASE').get<int>();

  Future<int> get base1_1 => _classTarget.memberVariable('BASE_1_1').get<int>();

  Future<int> get cupcake => _classTarget.memberVariable('CUPCAKE').get<int>();

  Future<int> get donut => _classTarget.memberVariable('DONUT').get<int>();

  Future<int> get eclair => _classTarget.memberVariable('ECLAIR').get<int>();

  Future<int> get eclair0_1 =>
      _classTarget.memberVariable('ECLAIR_0_1').get<int>();

  Future<int> get eclairMr1 =>
      _classTarget.memberVariable('ECLAIR_MR1').get<int>();

  Future<int> get froyo => _classTarget.memberVariable('FROYO').get<int>();

  Future<int> get gingerbread =>
      _classTarget.memberVariable('GINGERBREAD').get<int>();

  Future<int> get homeyComb =>
      _classTarget.memberVariable('HONEYCOMB').get<int>();

  Future<int> get homeyCombMr1 =>
      _classTarget.memberVariable('HONEYCOMB_MR1').get<int>();

  Future<int> get homeyCombMr2 =>
      _classTarget.memberVariable('HONEYCOMB_MR2').get<int>();

  Future<int> get iceCreamSandwich =>
      _classTarget.memberVariable('ICE_CREAM_SANDWICH').get<int>();

  Future<int> get iceCreamSandwichMr1 =>
      _classTarget.memberVariable('ICE_CREAM_SANDWICH_MR1').get<int>();

  Future<int> get jellyBean =>
      _classTarget.memberVariable('JELLY_BEAN').get<int>();

  Future<int> get jellyBeanMr1 =>
      _classTarget.memberVariable('JELLY_BEAN_MR1').get<int>();

  Future<int> get jellyBeanMr2 =>
      _classTarget.memberVariable('JELLY_BEAN_MR2').get<int>();

  Future<int> get kitKat => _classTarget.memberVariable('KITKAT').get<int>();

  Future<int> get kitKatWatch =>
      _classTarget.memberVariable('KITKAT_WATCH').get<int>();

  Future<int> get l => _classTarget.memberVariable('L').get<int>();

  Future<int> get lollipop =>
      _classTarget.memberVariable('LOLLIPOP').get<int>();

  Future<int> get lollipopMr1 =>
      _classTarget.memberVariable('LOLLIPOP_MR1').get<int>();

  Future<int> get m => _classTarget.memberVariable('M').get<int>();

  Future<int> get n => _classTarget.memberVariable('N').get<int>();

  Future<int> get nMr1 => _classTarget.memberVariable('N_MR1').get<int>();

  Future<int> get o => _classTarget.memberVariable('O').get<int>();

  Future<int> get oMr1 => _classTarget.memberVariable('O_MR1').get<int>();

  Future<int> get p => _classTarget.memberVariable('P').get<int>();
}
