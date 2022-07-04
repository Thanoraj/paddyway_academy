import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            await launchUrl(Uri.parse(waURL));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              joinButtonText,
              style: const TextStyle(fontSize: 18),
            ),
          )),
    );
  }
}
