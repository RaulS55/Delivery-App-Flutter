import 'package:deliveryproyect/src/data/models/notification.dart';
import 'package:deliveryproyect/src/data/providers/remote/websocket_provider.dart';
import 'package:deliveryproyect/src/data/repositories/websocket_repository.dart';

class WebsocketRepositoryImp implements WebsocketRepository {
  final WebsocketProvider _provider;

  WebsocketRepositoryImp(this._provider);
  @override
  Future<void> connect(String uri) {
    return _provider.connect(uri);
  }

  @override
  Stream<AppNotification> get onNotification => _provider.onNotification;

  @override
  Future<void> disconnect() {
    return _provider.disconnect();
  }
}
