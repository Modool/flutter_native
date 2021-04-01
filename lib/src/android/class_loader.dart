import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class ClassLoader {
  ClassLoader(this._target, this._classTarget);

  factory ClassLoader.from(NativeTarget target) =>
      ClassLoader(target, classTarget);

  static final classTarget =
      NativeRuntime().classNamed('java.lang.ClassLoader');

  final NativeTarget _target;
  final NativeTarget _classTarget;

  Future<bool> get registerAsParallelCapable =>
      _classTarget.method('registerAsParallelCapable').invoke<bool>();

  Future<String> resource(String name) => _target
      .method('getResource', arguments: [name])
      .method('toString')
      .invoke<String>();
}
