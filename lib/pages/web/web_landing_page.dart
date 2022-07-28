import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/widgets/code_text_field.dart';

import '../../services/user_management.dart';
import '../../theme_info.dart';
import '../../widgets/contact_us_button.dart';
import '../../widgets/submit_button.dart';
import '../home_page.dart';
import '../landing_page.dart';

class WebLandingPage extends StatelessWidget {
  WebLandingPage({Key? key}) : super(key: key);

  final _webFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("hiii");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(appName),
        actions: [
          Center(
            child: Text(
              contactUsText,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            child: Center(child: ContactUsButton()),
          ),
        ],
      ),
      body: Center(
        child: Form(
          key: _webFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    appWelcomeText,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: ThemeInfo.primaryTextColor),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    appName,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: ThemeInfo.primaryTextColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        logo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    codeText,
                    style: TextStyle(
                        fontSize: 20, color: ThemeInfo.primaryTextColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CodeTextField(),
                  const SizedBox(
                    height: 10,
                  ),
                  SubmitButton(
                    onPressed: () async {
                      if (_webFormKey.currentState!.validate()) {
                        await UserManager.validateUser(userID);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
