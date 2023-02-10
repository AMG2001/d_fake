import 'package:d_fake/config/dimensions.dart';
import 'package:d_fake/config/user_data_model/user_data_model.dart';
import 'package:d_fake/login_screen/login_screen.dart';
import 'package:d_fake/main_page_components.dart';
import 'package:d_fake/services/Shared_preferences/shared_preferences_class.dart';
import 'package:d_fake/services/custom_toast.dart';
import 'package:d_fake/splach_screen/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesClass.initAllSharedPreferences();
  runApp(DFakeApp());
}

class DFakeApp extends StatelessWidget {
  const DFakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplachScreenCustom(),
      title: "D_Fake",
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ImagePicker picker = ImagePicker();
  late XFile? image;
  bool userGettedImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green[600]),
              currentAccountPicture: Image.network(UserDataModel.userImageURL),
              accountName: Text(UserDataModel.userName),
              accountEmail: Text(UserDataModel.userEmail),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                CustomToast.showBlackToast(messsage: "implemented by : AMG 🤍");
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About Us'),
              onTap: () {
                CustomToast.showBlackToast(messsage: "implemented by : AMG 🤍");
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                Get.offAll(LoginScreen());
                await UserDataModel.userLoggedOut();
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("D_Fake"),
        backgroundColor: Colors.green[600],
      ),
      body: Container(
          width: Dimensions.width,
          height: Dimensions.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/main background.png'),
                  fit: BoxFit.fitWidth)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Click to Get Image/Video",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    // CustomToast.showRedToast(messsage: 'get image');
                    image = await picker.pickImage(source: ImageSource.gallery);
                  },
                  child: ImagePickerContainer(),
                ),
                // userGettedImage
                // ?
                // SizedBox(),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       height: 12,
                //     ),
                //     Text(
                //       "Image path : C://Users/mavica/amgad",
                //       style: TextStyle(fontSize: 16, color: Colors.white),
                //     ),
                //     SizedBox(
                //       height: 12,
                //     ),
                //     Text(
                //       "Image size : 2.6 MB",
                //       style: TextStyle(fontSize: 16, color: Colors.white),
                //     ),
                //     SizedBox(
                //       height: 12,
                //     ),
                //     Align(
                //       alignment: Alignment.center,
                //       child: OutlinedButton(
                //         style: OutlinedButton.styleFrom(
                //           side: BorderSide(width: 2.0, color: Colors.white),
                //         ),
                //         onPressed: () async {},
                //         child: Text(
                //           "Check Image",
                //           style: TextStyle(fontSize: 16, color: Colors.white),
                //         ),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          )),
    );
  }
}
