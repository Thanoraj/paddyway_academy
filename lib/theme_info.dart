import 'package:flutter/material.dart';

class ThemeInfo {
  // Colors
  static Color cardColor = const Color(0xff191c2d);
  static Color appBarColor = const Color(0x171616FF);
  static Color bgColor = Colors.black;
  static Color primaryTextColor = Colors.white;
  static Color secondaryTextColor = Colors.white70;
  static Color contrastPrimaryTextColor = Colors.black;
  static Color contrastSecondaryTextColor = Colors.black87;
  static Color primaryLightColor = Colors.white;
  static Color textBoxBorderColor = Colors.white54;
  static Color teachByTextContrastColor = Colors.yellow[400]!;
  static Color youtubeChannelBgColor = const Color(0xfff5f5f5);
  static Color channelWatchVideoButtonColor = const Color(0xffff3f3f);
  static Color sectionVideoButtonColor = const Color(0xffe86c6c);
  static Color sectionDocumentsButtonColor = const Color(0xff6ca1e7);
  static Color secondaryCardColor = Colors.grey[500]!;
  static Color downloadIconColor = Colors.red;
  static Color customFlatButtonDefaultColor = const Color(0xff6c609c);

  // borders
  static OutlineInputBorder textBoxBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white54, width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  );
  static RoundedRectangleBorder channelButtonBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
}
