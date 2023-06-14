//import 'dart:html' as html;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/pages/home_page.dart';
import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/pages/web/web_landing_page.dart';
import 'package:paddyway_academy/services/user_management.dart';
import 'package:paddyway_academy/theme_info.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //if (!kIsWeb) await Firebase.initializeApp();
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
    try {
      if (kIsWeb) {
        //if (Platform.isIOS || Platform.isAndroid) return;
        // if (html.window.navigator.cookieEnabled == null) {
        // } else if (!html.window.navigator.cookieEnabled!) {
        // } else {}
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  // loadHtmlLib() async {
  //   await deferredLibrary('dart:html') as html;
  // }

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
              if (kIsWeb) {
                if (width > 500) {
                  if (snapshot.data == true) {
                    return const HomePage();
                  } else {
                    return WebLandingPage();
                  }
                } else {
                  if (snapshot.data == true) {
                    return const HomePage();
                  } else {
                    return const LandingPage();
                  }
                }
              } else {
                if (snapshot.data == true) {
                  return const HomePage();
                } else {
                  return const LandingPage();
                }
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
          },),
    );
  }
}
