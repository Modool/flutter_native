import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class Editor {
  Editor._(this._target);

  final NativeTarget _target;

  ///
  /// Set a String value in the preferences editor, to be written back once
  /// {@link #commit} or {@link #apply} are called.
  ///
  /// @param key The name of the preference to modify.
  /// @param value The new value for the preference.  Passing {@code null}
  ///    for this argument is equivalent to calling {@link #remove(String)} with
  ///    this key.
  ///
  /// @return Returns a reference to the same Editor object, so you can
  /// chain put calls together.
  ///
  Editor putString(String key, String value) =>
      Editor._(_target.method('putString', arguments: [key, value]));

  ///
  /// Set a set of String values in the preferences editor, to be written
  /// back once {@link #commit} or {@link #apply} is called.
  ///
  /// @param key The name of the preference to modify.
  /// @param values The set of new values for the preference.  Passing {@code null}
  ///    for this argument is equivalent to calling {@link #remove(String)} with
  ///    this key.
  /// @return Returns a reference to the same Editor object, so you can
  /// chain put calls together.
  ///
  Editor putStringList(String key, List<String> values) =>
      Editor._(_target.method('putStringSet', arguments: [key, values]));

  ///
  /// Set an int value in the preferences editor, to be written back once
  /// {@link #commit} or {@link #apply} are called.
  ///
  /// @param key The name of the preference to modify.
  /// @param value The new value for the preference.
  ///
  /// @return Returns a reference to the same Editor object, so you can
  /// chain put calls together.
  ///
  Editor putInt(String key, int value) =>
      Editor._(_target.method('putLong', arguments: [key, value]));

  ///
  /// Set a float value in the preferences editor, to be written back once
  /// {@link #commit} or {@link #apply} are called.
  ///
  /// @param key The name of the preference to modify.
  /// @param value The new value for the preference.
  ///
  /// @return Returns a reference to the same Editor object, so you can
  /// chain put calls together.
  ///
  Editor putFloat(String key, double value) =>
      Editor._(_target.method('putFloat', arguments: [key, value]));

  ///
  /// Set a boolean value in the preferences editor, to be written back
  /// once {@link #commit} or {@link #apply} are called.
  ///
  /// @param key The name of the preference to modify.
  /// @param value The new value for the preference.
  ///
  /// @return Returns a reference to the same Editor object, so you can
  /// chain put calls together.
  ///
  Editor putBool(String key, {bool value}) =>
      Editor._(_target.method('putBool', arguments: [key, value]));

  ///
  /// Mark in the editor that a preference value should be removed, which
  /// will be done in the actual preferences once {@link #commit} is
  /// called.
  ///
  /// @param key The name of the preference to remove.
  ///
  /// @return Returns a reference to the same Editor object, so you can
  /// chain put calls together.
  ///
  Editor remove(String key) =>
      Editor._(_target.method('remove', arguments: [key]));

  ///
  /// Mark in the editor to remove <em>all</em> values from the
  /// preferences.  Once commit is called, the only remaining preferences
  /// will be any that you have defined in this editor.
  ///
  /// @return Returns a reference to the same Editor object, so you can
  /// chain put calls together.
  ///
  Editor clear() => Editor._(_target.method('clear'));

  ///
  /// Commit your preferences changes back from this Editor to the
  /// {@link SharedPreferences} object it is editing.  This atomically
  /// performs the requested modifications, replacing whatever is currently
  /// in the SharedPreferences.
  ///
  /// <p>Note that when two editors are modifying preferences at the same
  /// time, the last one to call commit wins.
  ///
  /// <p>If you don't care about the return value and you're
  /// using this from your application's main thread, consider
  /// using {@link #apply} instead.
  ///
  /// @return Returns true if the new values were successfully written
  /// to persistent storage.
  ///
  Future<bool> commit() => _target.method('commit').invoke<bool>();

  ///
  /// Commit your preferences changes back from this Editor to the
  /// {@link SharedPreferences} object it is editing.  This atomically
  /// performs the requested modifications, replacing whatever is currently
  /// in the SharedPreferences.
  ///
  Future<void> apply() => _target.method('apply').invoke<void>();
}

class SharedPreferences implements NativeRuntimeClass {
  SharedPreferences(this._target);

  final NativeTarget _target;

  static Future<SharedPreferences> keep(NativeTarget target) async {
    final success = await target.keep();
    if (!success) return null;

    return SharedPreferences(target);
  }

  @override
  Future<bool> dispose() => _target.dispose();

  ///
  /// Retrieve all values from the preferences.
  ///
  /// <p>Note that you <em>must not</em> modify the collection returned
  /// by this method, or alter any of its contents.  The consistency of your
  /// stored data is not guaranteed if you do.
  ///
  /// @return Returns a map containing a list of pairs key/value representing
  /// the preferences.
  ///
  /// @throws NullPointerException
  ///
  Future<Map<String, dynamic>> get all =>
      _target.method('getAll').invoke<Map<String, dynamic>>();

  ///
  /// Retrieve a String value from the preferences.
  ///
  /// @param key The name of the preference to retrieve.
  /// @param defValue Value to return if this preference does not exist.
  ///
  /// @return Returns the preference value if it exists, or defValue.  Throws
  /// ClassCastException if there is a preference with this name that is not
  /// a String.
  ///
  /// @throws ClassCastException
  ///
  Future<String> string(String key, String defValue) =>
      _target.method('getString', arguments: [key, defValue]).invoke<String>();

  ///
  /// Retrieve a set of String values from the preferences.
  ///
  /// <p>Note that you <em>must not</em> modify the set instance returned
  /// by this call.  The consistency of the stored data is not guaranteed
  /// if you do, nor is your ability to modify the instance at all.
  ///
  /// @param key The name of the preference to retrieve.
  /// @param defValues Values to return if this preference does not exist.
  ///
  /// @return Returns the preference values if they exist, or defValues.
  /// Throws ClassCastException if there is a preference with this name
  /// that is not a Set.
  ///
  /// @throws ClassCastException
  ///
  Future<List<String>> stringList(String key, List<String> defValues) =>
      _target.method('getStringSet',
          arguments: [key, defValues]).invoke<List<String>>();

  ///
  /// Retrieve an int value from the preferences.
  ///
  /// @param key The name of the preference to retrieve.
  /// @param defValue Value to return if this preference does not exist.
  ///
  /// @return Returns the preference value if it exists, or defValue.  Throws
  /// ClassCastException if there is a preference with this name that is not
  /// an int.
  ///
  /// @throws ClassCastException
  ///
  Future<int> getInt(String key, int defValue) =>
      _target.method('getLong', arguments: [key, defValue]).invoke<int>();

  ///
  /// Retrieve a float value from the preferences.
  ///
  /// @param key The name of the preference to retrieve.
  /// @param defValue Value to return if this preference does not exist.
  ///
  /// @return Returns the preference value if it exists, or defValue.  Throws
  /// ClassCastException if there is a preference with this name that is not
  /// a float.
  ///
  /// @throws ClassCastException
  ///
  Future<double> getFloat(String key, double defValue) =>
      _target.method('getFloat', arguments: [key, defValue]).invoke<double>();

  ///
  /// Retrieve a boolean value from the preferences.
  ///
  /// @param key The name of the preference to retrieve.
  /// @param defValue Value to return if this preference does not exist.
  ///
  /// @return Returns the preference value if it exists, or defValue.  Throws
  /// ClassCastException if there is a preference with this name that is not
  /// a boolean.
  ///
  /// @throws ClassCastException
  ///
  Future<bool> getBool(String key, {bool defValue}) =>
      _target.method('getBoolean', arguments: [key, defValue]).invoke<bool>();

  ///
  /// Checks whether the preferences contains a preference.
  ///
  /// @param key The name of the preference to check.
  /// @return Returns true if the preference exists in the preferences,
  ///         otherwise false.
  ///
  Future<bool> contains(String key) =>
      _target.method('contains', arguments: [key]).invoke<bool>();

  ///
  /// Create a new Editor for these preferences, through which you can make
  /// modifications to the data in the preferences and atomically commit those
  /// changes back to the SharedPreferences object.
  ///
  /// <p>Note that you <em>must</em> call {@link Editor#commit} to have any
  /// changes you perform in the Editor actually show up in the
  /// SharedPreferences.
  ///
  /// @return Returns a new instance of the {@link Editor} interface, allowing
  /// you to modify the values in this SharedPreferences object.
  ///
  Editor get edit => Editor._(_target.method('edit'));
}
