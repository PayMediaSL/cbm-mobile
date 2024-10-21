import 'package:share_plus/share_plus.dart';

import 'log_util.dart';

class ShareUtil {
  static Future<void> shareText(String text, {String? subject}) async {
    await Share.share(text, subject: subject);
  }

  static Future<void> shareFile(String filePath, {String? subject}) async {
    printLog('>>>> CALLING ON SHAREFILE <<<<');

    await Share.shareFilesWithResult([filePath], subject: subject);
  }
}
