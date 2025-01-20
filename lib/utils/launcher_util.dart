import 'package:cbm_one_app/utils/log_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LauncherUtil {
  LauncherUtil._();

  static Future<void> launchPhoneCall(String contactNumber) async {
    final phoneCallUri = Uri(
      scheme: 'tel',
      path: contactNumber,
    );

    await launchUrl(phoneCallUri);
  }

  static void url(String url, {LaunchMode? launchMode}) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrlString(
          url,
          mode: launchMode ?? LaunchMode.platformDefault,
        );
      } else {
        throw 'Could not launch -> $url';
      }
    } catch (e) {
      printLog(e, null, 1);
    }
  }
}
