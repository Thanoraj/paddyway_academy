import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/theme_info.dart';

class TeachByWidget extends StatelessWidget {
  const TeachByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: Image.asset(
            teachByImage,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                teachByText1,
                style: TextStyle(
                    fontSize: 15, color: ThemeInfo.teachByTextContrastColor),
              ),
              Text(
                teachByText2,
                style: TextStyle(
                    fontSize: 22,
                    color: ThemeInfo.primaryTextColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width > 400
                    ? 275
                    : MediaQuery.of(context).size.width - 125,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    teachByText3,
                    style: TextStyle(
                        fontSize: 13,
                        color: ThemeInfo.teachByTextContrastColor),
                  ),
                ),
              ),
              SizedBox(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    teachByText4,
                    style: TextStyle(
                        fontSize: 13,
                        color: ThemeInfo.teachByTextContrastColor),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
