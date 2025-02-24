import 'package:flutter/foundation.dart';

class GenericValueNotifier<T> extends ValueNotifier<T> {
  GenericValueNotifier(T value) : super(value);
}
