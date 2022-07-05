import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await launchUrl(Uri.parse(waURL));
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green[600],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 25,
                height: 25,
                child: Image.asset(
                  "assets/images/whatsapp.png",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                joinButtonText,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ));
  }
}
