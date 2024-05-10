import 'package:flutter/material.dart';
import 'package:ucp2/widget_screen/form_kuliner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hi"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormKulinerScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
