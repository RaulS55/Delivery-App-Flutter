import 'package:deliveryproyect/src/data/models/onboard_item.dart';
import 'package:flutter/widgets.dart';

class OnboardControler extends ChangeNotifier {
  final List<OnboardItem> items = [
    OnboardItem(
      image: "assets/pages/onboard/onboard-1.svg",
      title: "Get All The Fod",
      description:
          "ut I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.",
    ),
    OnboardItem(
      image: "assets/pages/onboard/onboard-2.svg",
      title: "Get Exact Nutrition",
      description:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem",
    ),
    OnboardItem(
      image: "assets/pages/onboard/onboard-3.svg",
      title: "Get Daily Calories",
      description:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem",
    )
  ];

  final PageController pageController = PageController();

  double? _currentPage = 0;
  double? get currenPage => _currentPage;

  void afterFirstLayaut() {
    pageController.addListener(() {
      final page = pageController.page;
      _currentPage = page;
      notifyListeners();
      //if (page! % 1 == 0 && _currentPage != page) {
      // _currentPage = page;
      //notifyListeners();
      //print(page);
      //}
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
