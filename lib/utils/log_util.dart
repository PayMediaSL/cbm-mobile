import 'dart:developer';

import 'package:cbm_one_app/parameters.dart';

void printLog(message, [Object? stackTrace, int? level]) {
  if (Env.enableLogs) {
    log(
      message.toString(),
      level: level ?? 0,
      stackTrace: stackTrace != null
          ? StackTrace.fromString(stackTrace.toString())
          : null,
    );
  }
}
