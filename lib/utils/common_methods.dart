//! Open Gmail

import 'package:url_launcher/url_launcher.dart';

Future<void> OpenEmailApp() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto', // This will open the default mail app
    // path: '', // No specific recipient
  );

  if (await canLaunch(emailLaunchUri.toString())) {
    await launch(emailLaunchUri.toString());
  } else {
    throw 'Could not launch email app';
  }
}
