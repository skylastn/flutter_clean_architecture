import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'home_state.dart';

class HomeController extends GetxController {
  HomeState state = HomeState();

  @override
  void onInit() {
    super.onInit();
  }

  void showProduct() {
    // isShowProduct = true;
    // update();
  }

  IconData getIcon(TabType tab) {
    if (tab == TabType.home) {
      return Icons.home;
    }
    if (tab == TabType.genre) {
      return Icons.panorama_wide_angle_select_outlined;
    }
    if (tab == TabType.library) {
      return Icons.my_library_books_sharp;
    }
    if (tab == TabType.me) {
      return Icons.account_circle_sharp;
    }
    return Icons.search;
  }
}