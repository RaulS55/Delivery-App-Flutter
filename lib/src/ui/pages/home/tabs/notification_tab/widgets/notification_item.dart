import 'package:deliveryproyect/src/data/models/notification.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItem extends StatelessWidget {
  final AppNotification notification;
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              child: Text("NT"),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.description,
                    style: MyFontStyles.regular,
                  ),
                  Text(
                    timeago.format(notification.createdAt),
                    style: MyFontStyles.normalGray,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
