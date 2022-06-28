import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';

class TeachByWidget extends StatelessWidget {
  const TeachByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: Image.asset(
            "assets/images/sajith.png",
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teachByText1,
                style: TextStyle(fontSize: 15, color: Colors.yellow[400]),
              ),
              Text(
                teachByText2,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 125,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    teachByText3,
                    style: TextStyle(fontSize: 13, color: Colors.yellow[400]),
                  ),
                ),
              ),
              Text(
                teachByText4,
                style: TextStyle(fontSize: 13, color: Colors.yellow[400]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
