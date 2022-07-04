import 'package:flutter/material.dart';
import 'package:paddyway_academy/theme_info.dart';

import '../constants.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function onPressed;
  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          await widget.onPressed();
          setState(() {
            isLoading = false;
          });
        },
        child: SizedBox(
          width: 130,
          height: 50,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: ThemeInfo.primaryLightColor,
                  )
                : Text(
                    submitButtonText,
                    style: const TextStyle(fontSize: 18),
                  ),
          ),
        ),
      ),
    );
  }
}
