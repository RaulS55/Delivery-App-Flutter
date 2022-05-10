import 'dart:async';

import 'package:deliveryproyect/src/data/models/notification.dart';
import 'package:deliveryproyect/src/data/repositories/websocket_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:flutter/cupertino.dart';

class NotificationControler extends ChangeNotifier {
  final _wsRepository = Get.i.find<WebsocketRepository>();

  late StreamSubscription _subscription;
  List<AppNotification> _notifications = [];
  List<AppNotification> get notifications => _notifications;
  final StreamController<List<AppNotification>> _notificationStreamController =
      StreamController.broadcast();

  Stream<List<AppNotification>> get onNotificationsChanged =>
      _notificationStreamController.stream;

  NotificationControler() {
    _subscription =
        _wsRepository.onNotification.listen(_onNotificationListener);
  }

  void _onNotificationListener(AppNotification notification) {
    _notifications = [notification, ...notifications];
    _notificationStreamController.sink.add(_notifications);
    //_notifications.add(notification);
    notifyListeners();
  }

  void clear() {
    _notifications = [];
  }

  @override
  void dispose() {
    _notificationStreamController.close();
    _subscription.cancel();
    super.dispose();
  }
}
