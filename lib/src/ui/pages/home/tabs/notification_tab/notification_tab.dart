import 'package:deliveryproyect/src/ui/global_controler/notification_controller.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/notification_tab/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({Key? key}) : super(key: key);

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final notiController = context.watch<NotificationControler>();
    final notifications = notiController.notifications;
    super.build(context); //PRESERVAR EL ESTADO DEL HOME TAB
    return ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (_, index) {
          final notification = notifications[index];
          return NotificationItem(notification: notification);
        });
  }

  @override //PRESERVAR EL ESTADO DEL HOME TAB
  bool get wantKeepAlive => true;
}
