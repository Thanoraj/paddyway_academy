import 'package:flutter/material.dart';

import '../constants.dart';
import '../pages/landing_page.dart';
import '../theme_info.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        child: Center(
          child: TextFormField(
            maxLines: 1,
            textAlignVertical: TextAlignVertical.top,
            validator: (String? val) {
              print(val);
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
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
    );
  }
}
