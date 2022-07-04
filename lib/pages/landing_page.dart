import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/services/user_management.dart';
import 'package:paddyway_academy/widgets/teach_by_widget.dart';

import '../models/user_model.dart';
import '../widgets/contact_us_button.dart';
import '../widgets/submit_button.dart';
import 'home_page.dart';

UserModel? currentUser;
String userID = '';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                appWelcomeText,
                style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                codeText,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  child: TextFormField(
                    validator: (String? val) {
                      if (val!.isEmpty) return "Please enter you code";
                      return null;
                    },
                    onChanged: (val) {
                      userID = val.trim();
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      letterSpacing: 4,
                    ),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white54, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white54, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white54, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SubmitButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
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
              const SizedBox(
                height: 20,
              ),
              const Center(child: TeachByWidget()),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  contactUsText,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const ContactUsButton(),
            ],
          ),
        ),
      ),
    );
  }
}
