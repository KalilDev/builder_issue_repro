import 'dart:async';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';

import 'package:source_gen/source_gen.dart';

const _bug = 'bug';

class BugGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    final annotatedWithBug = library.allElements.where((e) => e.metadata
        .map((ann) => ann.computeConstantValue())
        .where((obj) => obj.type.isDartCoreString)
        .map((obj) => obj.toStringValue())
        .any((str) => str == _bug));
    if (annotatedWithBug.isEmpty) {
      return null;
    }
    return 'const buggyLibrary = true;';
  }
}
