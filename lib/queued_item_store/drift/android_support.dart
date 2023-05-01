import 'package:sqlite3/open.dart';
import 'dart:ffi';

void setupSqlCipher() {
  open.overrideFor(
      OperatingSystem.android, () => DynamicLibrary.open('libsqlcipher.so'));
}
