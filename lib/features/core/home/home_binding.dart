import 'package:refreshed/refreshed.dart';

import 'home_controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HomeController>(
        () => HomeController(),
      ),
    ];
  }
}
