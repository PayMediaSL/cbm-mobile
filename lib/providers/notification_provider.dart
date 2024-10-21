import 'package:app/models/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

NotificationState getNotificationState(BuildContext context,
    [bool listen = false]) {
  return Provider.of<NotificationState>(context, listen: listen);
}
