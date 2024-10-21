import 'package:app/models/app_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppLanguage getAppLang(BuildContext context) {
  return Provider.of<AppLanguage>(context, listen: false);
}

String getLangStr(BuildContext context, String key) {
  try {
    return Provider.of<AppLanguage>(context, listen: true).getString(key);
  } catch (_) {
    return context.read<AppLanguage>().getString(key);
  }
}

String getLangReplaced(
    BuildContext context, String text, List<String> replacements) {
  String first = getLangStr(context, text);
  for (String r in replacements) {
    String second = getLangStr(context, r);
    first = first.replaceAll('?${replacements.indexOf(r) + 1}', second);
  }
  return first;
}
