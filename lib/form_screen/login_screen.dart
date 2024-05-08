import 'package:flutter/material.dart';
import 'package:ucp2/form_screen/home_screen.dart';
import 'package:ucp2/widget_screen/footer_screen.dart';
import 'package:ucp2/widget_screen/form_widget.dart';
import 'package:ucp2/widget_screen/header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const HeaderWidget(),
              FormWidget(
                  formKey: formKey, etEmail: email, etPassword: password),
              FooterWidget(
                onPressedLogin: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(email: email.text),
                        ),
                        (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Login berhasil"),
                    ));
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
