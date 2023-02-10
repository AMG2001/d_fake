import 'package:d_fake/config/theme/application_theme_controller.dart';
import 'package:d_fake/config/user_data_model/user_data_model.dart';
import 'package:get/get.dart';


class SharedPreferencesClass {
  static final applicationThemeController =
      Get.put(ApplicationThemeController(), permanent: true);
  static Future<void> initAllSharedPreferences() async {
    await UserDataModel.initiateUserDataModelSharedPref();
    await applicationThemeController.init();
  }
}
