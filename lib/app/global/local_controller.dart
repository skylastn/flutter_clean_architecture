import 'package:refreshed/refreshed.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalController extends GetxController {
  late SharedPreferences storage;
  @override
  Future<void> onInit() async {
    super.onInit();
    storage = await SharedPreferences.getInstance();
  }
}
