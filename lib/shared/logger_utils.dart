import 'dart:developer';

mixin Logger {
  // Sample of abstract logging function
  static void print(String msg) {
    log('^^^^^\n$msg\n^^^^^');
  }
}
