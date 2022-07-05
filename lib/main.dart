import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/pages/home_page.dart';
import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/services/user_management.dart';
import 'package:paddyway_academy/theme_info.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    if (!kIsWeb) getPermissions();
  }

  getPermissions() async {
    PermissionStatus status = await Permission.storage.status;
    status = await Permission.storage.request();

    if (await Permission.storage.status == PermissionStatus.granted &&
        await Permission.manageExternalStorage.status ==
            PermissionStatus.granted &&
        await Permission.accessMediaLocation.status ==
            PermissionStatus.granted) {
    } else {
      await Permission.accessMediaLocation.request();
      await Permission.manageExternalStorage.request();
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ThemeInfo.bgColor,
        appBarTheme: AppBarTheme(
          color: ThemeInfo.appBarColor,
        ),
      ),
      home: FutureBuilder(
          future: UserManager.checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == true) {
                return const HomePage();
              } else {
                return LandingPage();
              }
            } else {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        logo,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: LinearProgressIndicator(
                          color: ThemeInfo.primaryLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
