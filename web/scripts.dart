import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:heureka/cats.template.dart' as cats;

/// Main method called onload.
main () {
  // list categories
  runApp(cats.AppComponentNgFactory);
}

/// Overwrites standard sanitizer with nothing (because it is dumb).
class MySanitizer implements NodeTreeSanitizer {
  sanitizeTree(Node node) {}
}

/// Lazy loads CSS.
load_css () {
  querySelector('head').appendHtml(
    querySelector('noscript').innerHtml, treeSanitizer: MySanitizer());
}
