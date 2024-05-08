import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome To Jogja Hunter"),
        SizedBox(
          height: 25,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://th.bing.com/th/id/OIP.BHAz0m97iWqtGRreyUsF3QHaJQ?rs=1&pid=ImgDetMain"),
          radius: 100,
        )
      ],
    );
  }
}
