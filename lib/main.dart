import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/pages/home_page.dart';
import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/services/user_management.dart';
import 'package:paddyway_academy/theme_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  if (!kIsWeb) await Firebase.initializeApp();
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              double width = MediaQuery.of(context).size.width;
              if (kIsWeb && width > 600) {
                return const LandingPage();
              } else if (snapshot.data == true) {
                return const HomePage();
              } else {
                return const LandingPage();
              }
            } else {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          logo,
                          width: 200,
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: SizedBox(
                            width: 150,
                            child: LinearProgressIndicator(
                              color: ThemeInfo.primaryLightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
