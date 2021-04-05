library bug_generator;

import 'package:build/build.dart';
import 'src/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder bugBuilder(BuilderOptions options) => LibraryBuilder(
      BugGenerator(),
      generatedExtension: '.dart',
    );
