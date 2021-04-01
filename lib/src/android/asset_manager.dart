import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class AssetManager {
  AssetManager(this._target);

  factory AssetManager.from(NativeTarget target) => AssetManager(target);

  /// Return a global shared asset manager that provides access to only
  /// system assets (no application assets).
  /// @hide
  factory AssetManager.system(NativeTarget classTarget) =>
      AssetManager(classTarget.method('getSystem'));

  static final classTarget =
      NativeRuntime().classNamed('android.content.res.AssetManager');

  final NativeTarget _target;

  /// Ensures that the native implementation has not been destroyed.
  /// The AssetManager may have been closed, but references to it still exist
  /// and therefore the native implementation is not destroyed.
  Future<void> ensureValidLocked() =>
      _target.method('ensureValidLocked').invoke<void>();

  /// Ensures that the AssetManager has not been explicitly closed. If this method passes,
  /// then this implies that ensureValidLocked() also passes.
  Future<void> ensureOpenLocked() =>
      _target.method('ensureOpenLocked').invoke<void>();
}
