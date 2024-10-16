import 'dart:async';

import 'package:flutter/material.dart';

class ChangeNotifierTester<T extends ChangeNotifier> {
  final T _notifier;
  late Completer _completer;

  ChangeNotifierTester(this._notifier) {
    _notifier.addListener(_listener);
    _completer = Completer();
  }

  Future wait() async {
    await _completer.future;
    _completer = Completer();
  }

  void destroy() {
    _notifier.removeListener(_listener);
  }

  void _listener() {
    _completer.complete();
  }
}