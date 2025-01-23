import 'dart:developer';
import 'package:cbm_one_app/helpers/parameters.dart';

void printLog(message, [Object? stackTrace, int? level]) {
  if (Environment.enableLogs) {
    log(
      message.toString(),
      level: level ?? 0,
      stackTrace: stackTrace != null
          ? StackTrace.fromString(stackTrace.toString())
          : null,
    );
  }
}
