import 'dart:async';

import 'package:deliveryproyect/src/data/models/notification.dart';
import 'package:faker/faker.dart';

class WebsocketProvider {
  Timer? timer;

  _init() {
    timer = Timer.periodic(const Duration(seconds: 15), (_) {
      final Faker faker = Faker();
      final notification = AppNotification(
        id: DateTime.now().microsecondsSinceEpoch,
        title: faker.lorem.word(),
        description: faker.lorem.sentence(),
        content: {},
        createdAt: DateTime.now(),
      );
      controller.sink.add(notification);
    });
  }

  Future<void> connect(String uri) async {
    _init();
    await Future.delayed(const Duration(seconds: 2));
  }

  StreamController<AppNotification> controller = StreamController.broadcast();

  Stream<AppNotification> get onNotification => controller.stream;

  Future<void> disconnect() async {
    timer?.cancel();

    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> dispose() {
    return controller.close();
  }
}
