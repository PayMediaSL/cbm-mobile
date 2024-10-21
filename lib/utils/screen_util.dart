import 'package:flutter/material.dart';

class ScreenUtil {
  static Size? size;
  static MediaQueryData? mq;

  static double get width => size?.width ?? 0;
  static double get height => size?.height ?? 0;
}
