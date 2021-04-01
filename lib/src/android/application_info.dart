import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class ApplicationInfo {
  ApplicationInfo(this._target, this._classTarget);

  factory ApplicationInfo.from(NativeTarget target) =>
      ApplicationInfo(target, classTarget);

  static final classTarget =
      NativeRuntime().classNamed('android.content.pm.ApplicationInfo');

  final NativeTarget _classTarget;

  final NativeTarget _target;

  /// Default task affinity of all activities in this application. See
  /// {@link ActivityInfo#taskAffinity} for more information.  This comes
  /// from the "taskAffinity" attribute.
  ///
  Future<String> get taskAffinity =>
      _target.memberVariable('taskAffinity').get<String>();

  /// Optional name of a permission required to be able to access this
  /// application's components.  From the "permission" attribute.
  ///
  Future<String> get permission =>
      _target.memberVariable('permission').get<String>();

  /// The name of the process this application should run in.  From the
  /// "process" attribute or, if not set, the same as
  /// <var>packageName</var>.
  ///
  Future<String> get processName =>
      _target.memberVariable('processName').get<String>();

  /// Class implementing the Application object.  From the "class"
  /// attribute.
  ///
  Future<String> get className =>
      _target.memberVariable('className').get<String>();

  /// A style resource identifier (in the package's resources) of the
  /// description of an application.  From the "description" attribute
  /// or, if not set, 0.
  ///
  Future<int> get descriptionRes =>
      _target.memberVariable('descriptionRes').get<int>();

  /// A style resource identifier (in the package's resources) of the
  /// default visual theme of the application.  From the "theme" attribute
  /// or, if not set, 0.
  ///
  Future<int> get theme => _target.memberVariable('theme').get<int>();

  /// Class implementing the Application's manage space
  /// functionality.  From the "manageSpaceActivity"
  /// attribute. This is an optional attribute and will be null if
  /// applications don't specify it in their manifest
  ///
  Future<String> get manageSpaceActivityName =>
      _target.memberVariable('manageSpaceActivityName').get<String>();

  /// Class implementing the Application's backup functionality.  From
  /// the "backupAgent" attribute.  This is an optional attribute and
  /// will be null if the application does not specify it in its manifest.
  ///
  /// <p>If android:allowBackup is set to false, this attribute is ignored.
  ///
  Future<String> get backupAgentName =>
      _target.memberVariable('backupAgentName').get<String>();

  /// An optional attribute that indicates the app supports automatic backup of app data.
  /// <p>0 is the default and means the app's entire data folder + managed external storage will
  /// be backed up;
  /// Any negative value indicates the app does not support full-data backup, though it may still
  /// want to participate via the traditional key/value backup API;
  /// A positive number specifies an xml resource in which the application has defined its backup
  /// include/exclude criteria.
  /// <p>If android:allowBackup is set to false, this attribute is ignored.
  ///
  /// @see android.content.Context#getNoBackupFilesDir()
  /// @see #FLAG_ALLOW_BACKUP
  ///
  /// @hide
  ///
  Future<int> get fullBackupContent =>
      _target.memberVariable('fullBackupContent').get<int>();

  /// The default extra UI options for activities in this application.
  /// Set from the {@link android.R.attr#uiOptions} attribute in the
  /// activity's manifest.
  ///
  Future<int> get uiOptions => _target.memberVariable('uiOptions').get<int>();

  /// Private/hidden flags. See {@code PRIVATE_FLAG_...} constants.
  /// @hide
  ///
  Future<int> get privateFlags =>
      _target.memberVariable('privateFlags').get<int>();

  /// The required smallest screen width the application can run on.  If 0,
  /// nothing has been specified.  Comes from
  /// {@link android.R.styleable#AndroidManifestSupportsScreens_requiresSmallestWidthDp
  /// android:requiresSmallestWidthDp} attribute of the &lt;supports-screens&gt; tag.
  ///
  Future<int> get requiresSmallestWidthDp =>
      _target.memberVariable('requiresSmallestWidthDp').get<int>();

  /// The maximum smallest screen width the application is designed for.  If 0,
  /// nothing has been specified.  Comes from
  /// {@link android.R.styleable#AndroidManifestSupportsScreens_compatibleWidthLimitDp
  /// android:compatibleWidthLimitDp} attribute of the &lt;supports-screens&gt; tag.
  ///
  Future<int> get compatibleWidthLimitDp =>
      _target.memberVariable('compatibleWidthLimitDp').get<int>();

  /// The maximum smallest screen width the application will work on.  If 0,
  /// nothing has been specified.  Comes from
  /// {@link android.R.styleable#AndroidManifestSupportsScreens_largestWidthLimitDp
  /// android:largestWidthLimitDp} attribute of the &lt;supports-screens&gt; tag.
  ///
  Future<int> get largestWidthLimitDp =>
      _target.memberVariable('largestWidthLimitDp').get<int>();

  /// Value indicating the maximum aspect ratio the application supports.
  /// <p>
  /// 0 means unset.
  /// @See {@link android.R.attr#maxAspectRatio}.
  /// @hide
  ///
  Future<double> get maxAspectRatio =>
      _target.memberVariable('maxAspectRatio').get<double>();

  Future<String> get volumeUuid =>
      _target.memberVariable('volumeUuid').get<String>();

  Future<String> get scanSourceDir =>
      _target.memberVariable('scanSourceDir').get<String>();

  Future<String> get scanPublicSourceDir =>
      _target.memberVariable('scanPublicSourceDir').get<String>();

  /// Full path to the base APK for this application.
  ///
  Future<String> get sourceDir =>
      _target.memberVariable('sourceDir').get<String>();

  /// Full path to the publicly available parts of {@link #sourceDir},
  /// including resources and manifest. This may be different from
  /// {@link #sourceDir} if an application is forward locked.
  ///
  Future<String> get publicSourceDir =>
      _target.memberVariable('publicSourceDir').get<String>();

  /// The names of all installed split APKs, ordered lexicographically.
  ///
  Future<List<String>> get splitNames =>
      _target.memberVariable('splitNames').get<List<String>>();

  /// Full paths to zero or more split APKs, indexed by the same order as {@link #splitNames}.
  ///
  Future<List<String>> get splitSourceDirs =>
      _target.memberVariable('splitSourceDirs').get<List<String>>();

  /// Full path to the publicly available parts of {@link #splitSourceDirs},
  /// including resources and manifest. This may be different from
  /// {@link #splitSourceDirs} if an application is forward locked.
  ///
  /// @see #splitSourceDirs
  ///
  Future<List<String>> get splitPublicSourceDirs =>
      _target.memberVariable('splitPublicSourceDirs').get<List<String>>();

  /// Full paths to the locations of extra resource packages (runtime overlays)
  /// this application uses. This field is only used if there are extra resource
  /// packages, otherwise it is null.
  ///
  /// {@hide}
  ///
  Future<List<String>> get resourceDirs =>
      _target.memberVariable('resourceDirs').get<List<String>>();

  /// String retrieved from the seinfo tag found in selinux policy. This value can be set through
  /// the mac_permissions.xml policy construct. This value is used for setting an SELinux security
  /// context on the process as well as its data directory.
  ///
  /// {@hide}
  ///
  Future<String> get seInfo => _target.memberVariable('seInfo').get<String>();

  /// The seinfo tag generated per-user. This value may change based upon the
  /// user's configuration. For example, when an instant app is installed for
  /// a user. It is an error if this field is ever {@code null} when trying to
  /// start a new process.
  /// <p>NOTE: We need to separate this out because we modify per-user values
  /// multiple times. This needs to be refactored since we're performing more
  /// work than necessary and these values should only be set once. When that
  /// happens, we can merge the per-user value with the seInfo state above.
  ///
  /// {@hide}
  ///
  Future<String> get seInfoUser =>
      _target.memberVariable('seInfoUser').get<String>();

  /// Paths to all shared libraries this application is linked against.  This
  /// field is only set if the {@link PackageManager#GET_SHARED_LIBRARY_FILES
  /// PackageManager.GET_SHARED_LIBRARY_FILES} flag was used when retrieving
  /// the structure.
  ///
  Future<List<String>> get sharedLibraryFiles =>
      _target.memberVariable('sharedLibraryFiles').get<List<String>>();

  /// Full path to the default directory assigned to the package for its
  /// persistent data.
  ///
  Future<String> get dataDir => _target.memberVariable('dataDir').get<String>();

  /// Full path to the device-protected directory assigned to the package for
  /// its persistent data.
  ///
  /// @see Context#createDeviceProtectedStorageContext()
  ///
  Future<String> get deviceProtectedDataDir =>
      _target.memberVariable('deviceProtectedDataDir').get<String>();

  /// Full path to the credential-protected directory assigned to the package
  /// for its persistent data.
  ///
  /// @hide
  ///
  Future<String> get credentialProtectedDataDir =>
      _target.memberVariable('credentialProtectedDataDir').get<String>();

  /// Full path to the directory where native JNI libraries are stored.
  ///
  Future<String> get nativeLibraryDir =>
      _target.memberVariable('nativeLibraryDir').get<String>();

  /// Full path where unpacked native libraries for {@link #secondaryCpuAbi}
  /// are stored, if present.
  ///
  /// The main reason this exists is for bundled multi-arch apps, where
  /// it's not trivial to calculate the location of libs for the secondary abi
  /// given the location of the primary.
  ///
  /// @hide
  ///
  Future<String> get secondaryNativeLibraryDir =>
      _target.memberVariable('secondaryNativeLibraryDir').get<String>();

  /// The root path where unpacked native libraries are stored.
  /// <p>
  /// When {@link #nativeLibraryRootRequiresIsa} is set, the libraries are
  /// placed in ISA-specific subdirectories under this path, otherwise the
  /// libraries are placed directly at this path.
  ///
  /// @hide
  ///
  Future<String> get nativeLibraryRootDir =>
      _target.memberVariable('nativeLibraryRootDir').get<String>();

  /// Flag indicating that ISA must be appended to
  /// {@link #nativeLibraryRootDir} to be useful.
  ///
  /// @hide
  ///
  Future<bool> get nativeLibraryRootRequiresIsa =>
      _target.memberVariable('nativeLibraryRootRequiresIsa').get<bool>();

  /// The primary ABI that this application requires, This is inferred from the ABIs
  /// of the native JNI libraries the application bundles. Will be {@code null}
  /// if this application does not require any particular ABI.
  ///
  /// If non-null, the application will always be launched with this ABI.
  ///
  /// {@hide}
  ///
  Future<String> get primaryCpuAbi =>
      _target.memberVariable('primaryCpuAbi').get<String>();

  /// The secondary ABI for this application. Might be non-null for multi-arch
  /// installs. The application itself never uses this ABI, but other applications that
  /// use its code might.
  ///
  /// {@hide}
  ///
  Future<String> get secondaryCpuAbi =>
      _target.memberVariable('secondaryCpuAbi').get<String>();

  /// The kernel user-ID that has been assigned to this application;
  /// currently this is not a unique ID (multiple applications can have
  /// the same uid).
  ///
  Future<int> get uid => _target.memberVariable('uid').get<int>();

  /// The minimum SDK version this application can run on. It will not run
  /// on earlier versions.
  ///
  Future<int> get minSdkVersion =>
      _target.memberVariable('minSdkVersion').get<int>();

  /// The minimum SDK version this application targets.  It may run on earlier
  /// versions, but it knows how to work with any new behavior added at this
  /// version.  Will be {@link android.os.Build.VERSION_CODES#CUR_DEVELOPMENT}
  /// if this is a development build and the app is targeting that.  You should
  /// compare that this number is >= the SDK version number at which your
  /// behavior was introduced.
  ///
  Future<int> get targetSdkVersion =>
      _target.memberVariable('targetSdkVersion').get<int>();

  /// The app's declared version code.
  /// @hide
  ///
  Future<int> get longVersionCode =>
      _target.memberVariable('longVersionCode').get<int>();

  /// An integer representation of the app's declared version code. This is being left in place as
  /// some apps were using reflection to access it before the move to long in
  /// {@link android.os.Build.VERSION_CODES#P}
  /// @deprecated Use {@link #longVersionCode} instead.
  /// @hide
  ///
  Future<int> get versionCode =>
      _target.memberVariable('versionCode').get<int>();

  /// The user-visible SDK version (ex. 26) of the framework against which the application claims
  /// to have been compiled, or {@code 0} if not specified.
  /// <p>
  /// This property is the compile-time equivalent of
  /// {@link android.os.Build.VERSION#CODENAME Build.VERSION.SDK_INT}.
  ///
  /// @hide For platform use only; we don't expect developers to need to read this value.
  ///
  Future<int> get compileSdkVersion =>
      _target.memberVariable('compileSdkVersion').get<int>();

  /// The development codename (ex. "O", "REL") of the framework against which the application
  /// claims to have been compiled, or {@code null} if not specified.
  /// <p>
  /// This property is the compile-time equivalent of
  /// {@link android.os.Build.VERSION#CODENAME Build.VERSION.CODENAME}.
  ///
  /// @hide For platform use only; we don't expect developers to need to read this value.
  ///
  Future<String> get compileSdkVersionCodename =>
      _target.memberVariable('compileSdkVersionCodename').get<String>();

  /// When false, indicates that all components within this application are
  /// considered disabled, regardless of their individually set enabled status.
  ///
  Future<bool> get enabled => _target.memberVariable('enabled').get<bool>();

  /// For convenient access to the current enabled setting of this app.
  /// @hide
  ///
  Future<int> get enabledSetting =>
      _target.memberVariable('enabledSetting').get<int>();

  /// For convenient access to package's install location.
  /// @hide
  ///
  Future<int> get installLocation =>
      _target.memberVariable('installLocation').get<int>();

  /// Resource file providing the application's Network Security Config.
  /// @hide
  ///
  Future<int> get networkSecurityConfigRes =>
      _target.memberVariable('networkSecurityConfigRes').get<int>();

  /// Version of the sandbox the application wants to run in.
  /// @hide
  ///
  Future<int> get targetSandboxVersion =>
      _target.memberVariable('targetSandboxVersion').get<int>();

  /// The factory of this package, as specified by the &lt;manifest&gt;
  /// tag's {@link android.R.styleable#AndroidManifestApplication_appComponentFactory}
  /// attribute.
  ///
  Future<int> get appComponentFactory =>
      _target.memberVariable('appComponentFactory').get<int>();

  /// The category of this app. Categories are used to cluster multiple apps
  /// together into meaningful groups, such as when summarizing battery,
  /// network, or disk usage. Apps should only define this value when they fit
  /// well into one of the specific categories.
  /// <p>
  /// Set from the {@link android.R.attr#appCategory} attribute in the
  /// manifest. If the manifest doesn't define a category, this value may have
  /// been provided by the installer via
  /// {@link PackageManager#setApplicationCategoryHint(String, int)}.
  ///
  Future<int> get category => _target.memberVariable('category').get<int>();

  Future<String> get classLoaderName =>
      _target.memberVariable('classLoaderName').get<String>();

  Future<List<String>> get splitClassLoaderNames =>
      _target.memberVariable('splitClassLoaderNames').get<List<String>>();

  Future<bool> isValidHiddenApiEnforcementPolicy(int policy) =>
      _classTarget.method('isValidHiddenApiEnforcementPolicy',
          arguments: [policy]).invoke<bool>();

  Future<int> get mHiddenApiPolicy =>
      _target.memberVariable('mHiddenApiPolicy').get<int>();

  /// @return true if "supportsRtl" has been set to true in the AndroidManifest
  /// @hide
  ///
  Future<bool> get hasRtlSupport =>
      _target.method('hasRtlSupport').invoke<bool>();

  Future<bool> get hasCode => _target.method('hasCode').invoke<bool>();

  /// Disable compatibility mode
  ///
  /// @hide
  ///
  Future<void> disableCompatibilityMode() =>
      _target.method('disableCompatibilityMode').invoke<void>();

  /// Is using compatibility mode for non densty aware legacy applications.
  ///
  /// @hide
  ///
  Future<bool> get usesCompatibilityMode =>
      _target.method('usesCompatibilityMode').invoke<bool>();

  Future<void> initForUser(int userId) =>
      _target.method('initForUser', arguments: [userId]).invoke<void>();

  Future<bool> get packageWhitelistedForHiddenApis =>
      _target.method('isPackageWhitelistedForHiddenApis').invoke<bool>();

  Future<bool> get allowedToUseHiddenApis =>
      _target.method('isAllowedToUseHiddenApis').invoke<bool>();

  Future<int> get hiddenApiEnforcementPolicy =>
      _target.method('getHiddenApiEnforcementPolicy').invoke<int>();

  /// @hide
  ///
  Future<void> setHiddenApiEnforcementPolicy(int policy) =>
      _target.method('setHiddenApiEnforcementPolicy',
          arguments: [policy]).invoke<void>();

  /// Updates the hidden API enforcement policy for this app from the given values, if appropriate.
  ///
  /// This will have no effect if this app is not subject to hidden API enforcement, i.e. if it
  /// is on the package whitelist.
  ///
  /// @param policyPreP configured policy for pre-P apps, or {@link
  ///        #HIDDEN_API_ENFORCEMENT_DEFAULT} if nothing configured.
  /// @param policyP configured policy for apps targeting P or later, or {@link
  ///        #HIDDEN_API_ENFORCEMENT_DEFAULT} if nothing configured.
  /// @hide
  ///
  Future<void> maybeUpdateHiddenApiEnforcementPolicy() =>
      _target.method('maybeUpdateHiddenApiEnforcementPolicy').invoke<void>();

  /// @hide
  ///
  Future<void> setVersionCode(int newVersionCode) => _target
      .method('setVersionCode', arguments: [newVersionCode]).invoke<void>();

  Future<bool> get isDefaultToDeviceProtectedStorage =>
      _target.method('isDefaultToDeviceProtectedStorage').invoke<bool>();

  Future<bool> get isDirectBootAware =>
      _target.method('isDirectBootAware').invoke<bool>();

  Future<bool> get isEncryptionAware =>
      _target.method('isEncryptionAware').invoke<bool>();

  Future<bool> get isExternal => _target.method('isExternal').invoke<bool>();

  Future<bool> get isExternalAsec =>
      _target.method('isExternalAsec').invoke<bool>();

  Future<bool> get isForwardLocked =>
      _target.method('isForwardLocked').invoke<bool>();

  /// True if the application is installed as an instant app.
  /// @hide
  ///
  Future<bool> get isInstantApp =>
      _target.method('isInstantApp').invoke<bool>();

  Future<bool> get isInternal => _target.method('isInternal').invoke<bool>();

  Future<bool> get isOem => _target.method('isOem').invoke<bool>();

  Future<bool> get isPartiallyDirectBootAware =>
      _target.method('isPartiallyDirectBootAware').invoke<bool>();

  Future<bool> get isSignedWithPlatformKey =>
      _target.method('isSignedWithPlatformKey').invoke<bool>();

  Future<bool> get isPrivilegedApp =>
      _target.method('isPrivilegedApp').invoke<bool>();

  Future<bool> get isRequiredForSystemUser =>
      _target.method('isRequiredForSystemUser').invoke<bool>();

  Future<bool> get isStaticSharedLibrary =>
      _target.method('isStaticSharedLibrary').invoke<bool>();

  Future<bool> get isSystemApp => _target.method('isSystemApp').invoke<bool>();

  Future<bool> get isUpdatedSystemApp =>
      _target.method('isUpdatedSystemApp').invoke<bool>();

  Future<bool> get isVendor => _target.method('isVendor').invoke<bool>();

  Future<bool> get isProduct => _target.method('isProduct').invoke<bool>();

  /// Returns whether or not this application was installed as a virtual preload.
  ///
  Future<bool> get isVirtualPreload =>
      _target.method('isVirtualPreload').invoke<bool>();

  /// Returns true if the app has declared in its manifest that it wants its split APKs to be
  /// loaded into isolated Contexts, with their own ClassLoaders and Resources objects.
  /// @hide
  ///
  Future<bool> requestsIsolatedSplitLoading() =>
      _target.method('requestsIsolatedSplitLoading').invoke<bool>();

  /// @hide
  ApplicationInfo get applicationInfo =>
      ApplicationInfo(_target.method('getApplicationInfo'), _classTarget);

  Future<void> setCodePath(String codePath) =>
      _target.method('setCodePath', arguments: [codePath]).invoke<void>();

  Future<void> setBaseCodePath(String baseCodePath) =>
      _target.method('setCodePath', arguments: [baseCodePath]).invoke<void>();

  Future<void> setSplitCodePaths(List<String> splitCodePaths) => _target
      .method('setSplitCodePaths', arguments: [splitCodePaths]).invoke<void>();

  Future<void> setResourcePath(String resourcePath) => _target
      .method('setResourcePath', arguments: [resourcePath]).invoke<void>();

  Future<void> setBaseResourcePath(String baseResourcePath) =>
      _target.method('setBaseResourcePath',
          arguments: [baseResourcePath]).invoke<void>();

  Future<void> setSplitResourcePaths(List<String> splitResourcePaths) =>
      _target.method('setSplitResourcePaths',
          arguments: [splitResourcePaths]).invoke<void>();

  Future<String> get codePath => _target.method('getCodePath').invoke<String>();

  Future<String> get baseCodePath =>
      _target.method('getBaseCodePath').invoke<String>();

  Future<List<String>> get splitCodePaths =>
      _target.method('getSplitCodePaths').invoke<List<String>>();

  Future<String> get resourcePath =>
      _target.method('getResourcePath').invoke<String>();

  Future<String> get baseResourcePath =>
      _target.method('getBaseResourcePath').invoke<String>();

  Future<List<String>> get splitResourcePaths =>
      _target.method('getSplitResourcePaths').invoke<List<String>>();
}
