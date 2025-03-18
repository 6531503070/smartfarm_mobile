import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GlobalState {
  static final locale = ValueNotifier(Locale('en', 'EN'));
}
