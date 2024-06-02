import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:refreshed/refreshed.dart';

import '../../../app/global/model/content_model.dart';

class HomeController extends GetxController {
  List<String> imageList = [
    'https://static.vecteezy.com/system/resources/previews/007/301/684/original/pet-shop-banner-design-template-cartoon-illustration-of-cats-dogs-house-food-vector.jpg',
    'https://i1.wp.com/pet-care.co.za/wp-content/uploads/2018/07/Pet-Care-Banner.jpg?ssl=1'
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];
  bool isShowProduct = false;
  List<ContentModel> listService = [
    ContentModel(
      index: 0,
      content: 'assets/icons/ic_grooming.png',
      type: ServiceType.grooming,
      name: 'Grooming',
    ),
    ContentModel(
        index: 1,
        content: 'assets/icons/ic_daycare.png',
        type: ServiceType.daycare,
        name: 'Daycare'),
    ContentModel(
        index: 2,
        content: 'assets/icons/ic_walking.png',
        type: ServiceType.walking,
        name: 'Walking'),
    ContentModel(
      index: 3,
      content: 'assets/icons/ic_training.png',
      type: ServiceType.training,
      name: 'Training',
    ),
    ContentModel(
        index: 4,
        content: 'assets/icons/ic_petTaxi.png',
        type: ServiceType.petTaxi,
        name: 'Pet Taxi'),
    ContentModel(
      index: 5,
      content: 'assets/icons/ic_sitting.png',
      type: ServiceType.sitting,
      name: 'Sitting',
    ),
    ContentModel(
      index: 6,
      content: 'assets/icons/ic_boarding.png',
      type: ServiceType.boarding,
      name: 'Boarding',
    ),
    ContentModel(
      index: 7,
      content: 'assets/icons/ic_moreBlue.png',
      type: ServiceType.more,
      name: 'More',
    ),
  ];

  List<ContentModel> listTab = [
    ContentModel(
      index: 0,
      content: '',
      name: 'Search',
      type: TabType.search,
    ),
    ContentModel(
      index: 1,
      content: '',
      name: 'Request',
      type: TabType.request,
    ),
    ContentModel(
      index: 2,
      content: '',
      name: 'Timeline',
      type: TabType.timeline,
    ),
    ContentModel(
      index: 3,
      content: '',
      name: 'Bag',
      type: TabType.bag,
    ),
    ContentModel(
      index: 4,
      content: '',
      name: 'Profile',
      type: TabType.profile,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void showProduct() {
    isShowProduct = true;
    update();
  }

  IconData getIcon(TabType tab) {
    if (tab == TabType.request) {
      return Icons.edit_document;
    }
    if (tab == TabType.timeline) {
      return Icons.access_time_sharp;
    }
    if (tab == TabType.bag) {
      return Icons.shopping_bag_outlined;
    }
    if (tab == TabType.profile) {
      return Icons.account_circle_sharp;
    }
    return Icons.search;
  }
}

enum ServiceType {
  grooming,
  daycare,
  walking,
  training,
  petTaxi,
  sitting,
  boarding,
  more,
}

enum TabType {
  search,
  request,
  timeline,
  bag,
  profile,
}
