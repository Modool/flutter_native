import 'package:flutter_native_runtime/flutter_native_runtime.dart';

import 'asset_manager.dart';

class ResourcesImpl {
  ResourcesImpl(this._target, this._classTarget);

  factory ResourcesImpl.from(NativeTarget target) =>
      ResourcesImpl(target, classTarget);

  static final classTarget = NativeRuntime().classNamed('ResourcesImp');

  final NativeTarget _target;
  final NativeTarget _classTarget;

  AssetManager get assets => AssetManager.from(_target.method('getAssets'));

  Future<int> attrForQuantityCode(String quantityCode) => _classTarget
      .method('attrForQuantityCode', arguments: [quantityCode]).invoke<int>();
}
