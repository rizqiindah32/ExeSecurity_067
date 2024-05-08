import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key, required this.onPressedLogin});

  final VoidCallback onPressedLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        ElevatedButton(onPressed: onPressedLogin, child: Text("Login"))
      ],
    );
  }
}
