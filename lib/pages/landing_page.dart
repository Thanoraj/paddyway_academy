import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/services/user_management.dart';
import 'package:paddyway_academy/theme_info.dart';
import 'package:paddyway_academy/widgets/teach_by_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/user_model.dart';
import '../widgets/contact_us_button.dart';
import '../widgets/submit_button.dart';
import 'home_page.dart';

UserModel? currentUser;
String userID = '';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double availableSpace = MediaQuery.of(context).size.height - 675 > 0
        ? MediaQuery.of(context).size.height - 675
        : 0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: availableSpace / 6,
                ),
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
                SizedBox(
                  height: availableSpace / 6,
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
                SizedBox(
                  height: availableSpace / 6,
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
                Center(
                  child: SizedBox(
                    width: 150,
                    child: Center(
                      child: TextFormField(
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.top,
                        validator: (String? val) {
                          if (val!.isEmpty) return emptySubmitText;
                          return null;
                        },
                        onChanged: (val) {
                          userID = val.trim();
                        },
                        style: const TextStyle(
                          fontSize: 20,
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          filled: true,
                          fillColor: ThemeInfo.codeFieldFillColor,
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: ThemeInfo.primaryTextColor,
                          ),
                          enabledBorder: ThemeInfo.textBoxBorder,
                          border: ThemeInfo.textBoxBorder,
                          focusedBorder: ThemeInfo.textBoxBorder,
                        ),
                        cursorColor: ThemeInfo.primaryLightColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SubmitButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await UserManager.validateUser(userID);
                      if (currentUser != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: availableSpace / 6,
                ),
                Center(
                  child: Text(
                    contactUsText,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Center(child: ContactUsButton()),
                ),
                Center(
                  child: Text(
                    youtubeText,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            launchUrl(
                                Uri.parse(
                                  channelUrl,
                                ),
                                mode: LaunchMode.externalApplication);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: ThemeInfo.channelWatchVideoButtonColor,
                              shape: ThemeInfo.channelButtonBorder),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                    height: 20,
                                    child: Image.asset(
                                        "assets/images/youtube.png")),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  channelButtonText,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ))),
                ),
                SizedBox(
                  height: availableSpace / 6,
                ),
                const Center(
                  child: TeachByWidget(),
                ),
                SizedBox(
                  height: availableSpace / 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
