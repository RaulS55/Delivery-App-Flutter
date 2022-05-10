import 'dart:async';

import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/data/repositories/websocket_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/ui/global_controler/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

class HomeController extends ChangeNotifier implements TickerProvider {
  final NotificationControler notificationControler;

  HomeController(this.notificationControler) {
    _init();
  }

  final _wsRepository = Get.i.find<WebsocketRepository>();
  int _currentPage = 0;
  int get currentPage => _currentPage;
  Map<int, Dish> _favorites = {};
  Map<int, Dish> get favorites => _favorites;
  bool isFavorite(Dish dish) => _favorites.containsKey(dish.id);

  void Function()? onDispose;

  void addFavorite(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    //Controlo si ya esta en favoritos
    if (isFavorite(dish)) {
      copy.remove(dish.id);
    } else {
      copy[dish.id] = dish;
    }
    _favorites = copy;
    notifyListeners();
  }

  void deleteFavorite(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    //Controlo si ya esta en favoritos
    if (isFavorite(dish)) {
      copy.remove(dish.id);
      _favorites = copy;
      notifyListeners();
    }
  }

  TabController? tabController;

  void _init() async {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  StreamSubscription? _notificationSubscription;

  void afterFirstLayaut() {
    _wsRepository.connect("http//SIMULACIONDEWEB");
    _notificationSubscription =
        notificationControler.onNotificationsChanged.listen((notifications) {
      final int count = notifications.length;

      List<BottomBarItem> copy = [..._menuItems];
      copy[2] = copy[2].copyWith(bagetCount: count);
      _menuItems = copy;
      notifyListeners();
    });
    tabController!.addListener(() {
      _currentPage = tabController!.index;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _notificationSubscription?.cancel();
    tabController?.dispose();
    if (onDispose != null) {
      onDispose!();
    }
    super.dispose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }

  List<BottomBarItem> _menuItems = [
    BottomBarItem(icon: "assets/pages/home/home.svg", label: "Home"),
    BottomBarItem(icon: "assets/pages/home/favorite.svg", label: "Favorite"),
    BottomBarItem(icon: "assets/pages/home/bell.svg", label: "Notifications"),
    BottomBarItem(icon: "assets/pages/home/avatar.svg", label: "Avatar"),
  ];
  List<BottomBarItem> get menuItems => _menuItems;
}

class BottomBarItem {
  final String icon, label;
  final int bagetCount;

  BottomBarItem({required this.icon, required this.label, this.bagetCount = 0});

  BottomBarItem copyWith({String? icon, String? label, int? bagetCount}) {
    return BottomBarItem(
        icon: icon ?? this.icon,
        label: label ?? this.label,
        bagetCount: bagetCount ?? this.bagetCount);
  }
}
