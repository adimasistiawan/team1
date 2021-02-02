import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConstantController extends GetxController {
  String token;

  @override
  void onInit() {
    // TODO: implement onInit
    share();
    super.onInit();
  }

  share() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString('token');
    update();
  }
}
