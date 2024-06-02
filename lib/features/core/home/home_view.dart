import 'package:carousel_slider_x/carousel_slider_x.dart';
import 'package:flutter/material.dart';
import 'package:lugu_pet/app/global/model/content_model.dart';
import 'package:lugu_pet/utility/shared/widget/mobile_size_widget.dart';
import 'package:refreshed/refreshed.dart';
import '../../../app/theme/style.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return MobileSizeWidget(
          padding: EdgeInsets.zero,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          color: ColorConstant.primaryColor,
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 0,
                            top: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText: 'Find What you need',
                                    fillColor: Colors.white,
                                    prefixIcon: Container(
                                      margin: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: const Icon(Icons.search),
                                    ),
                                    prefixIconConstraints: const BoxConstraints(
                                      minWidth: 0,
                                      minHeight: 0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   style: ElevatedButton.styleFrom(
                              //     shape: const CircleBorder(),
                              //     padding: const EdgeInsets.all(20),
                              //     backgroundColor: ColorConstant.orange,
                              //     foregroundColor: Colors.red,
                              //   ),
                              //   child: const Icon(
                              //     Icons.person,
                              //     color: Colors.white,
                              //   ),
                              // )
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: ColorConstant.orange,
                                padding: const EdgeInsets.all(15.0),
                                shape: const CircleBorder(),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  // size: 35.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        CarouselSlider(
                          options: const CarouselOptions(
                            height: 200,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                            autoPlay: true,
                          ),
                          items: controller.imageList
                              .map(
                                (item) => SizedBox(
                                  width: Get.width,
                                  child: Image.network(
                                    item,
                                    fit: BoxFit.fill,
                                    height: 200,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 20),
                        walletWidget(),
                        const SizedBox(height: 10),
                        serviceWidget(),
                        const SizedBox(height: 5),
                        if (!controller.isShowProduct)
                          InkWell(
                            onTap: () => controller.showProduct(),
                            child: Image.asset(
                              'assets/images/im_productBanner.png',
                              height: 150,
                              width: Get.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                        if (controller.isShowProduct) showProductWidget(),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  height: 65,
                  color: ColorConstant.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var content in controller.listTab)
                        tabContentWidget(content, content.type)
                    ],
                  ),
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: controller.listTab.length,
                  //   itemBuilder: (context, index) {
                  //     ContentModel content = controller.listTab[index];
                  //     TabType tabType = content.type;
                  //     return Container(
                  //       child: Column(
                  //         children: [
                  //           Icon(controller.getIcon(tabType), size: 40),
                  //           Text(content.name),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget tabContentWidget(ContentModel content, TabType tabType) {
    return Column(
      children: [
        Icon(
          controller.getIcon(tabType),
          size: 30,
          color: Colors.white,
        ),
        Text(
          content.name,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget walletWidget() {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.primaryColor,
        // border: Border.all(
        //   color: ColorConstant.primaryColor,
        // ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset('assets/icons/ic_handCat.png', height: 25),
          ),
          const Expanded(
            flex: 3,
            child: Text(
              '500 Token',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Image.asset('assets/icons/ic_topUp.png', height: 20),
                const Text(
                  'Top Up',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Image.asset('assets/icons/ic_more.png', height: 20),
                const Text(
                  'More',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceWidget() {
    Get.log('is Phone : ${Get.context?.isPhone}');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // number of items in each row
          mainAxisSpacing: 4.0, // spacing between rows
          crossAxisSpacing: 4.0, // spacing between columns
          childAspectRatio: Get.context?.isPhone == true ? 2 / 3 : 4 / 3,
        ),
        itemCount: controller.listService.length,
        itemBuilder: (BuildContext context, int index) {
          ContentModel content = controller.listService[index];
          // ServiceType serviceType = content.type;
          return Column(
            children: [
              Image.asset(content.content, height: 70),
              // const SizedBox(height: 4),
              Text(
                content.name,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget showProductWidget() {
    return Container();
  }
}
