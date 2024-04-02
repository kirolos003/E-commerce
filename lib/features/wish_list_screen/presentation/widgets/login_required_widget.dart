import 'package:flutter/material.dart';

class LoginRequiredWidget extends StatelessWidget {
  String message;
  VoidCallback? onLoginClicked;
  LoginRequiredWidget(this.message , this.onLoginClicked , {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/unauthorized.jpeg')),
              SizedBox(height: 20),
              Text(message),
              SizedBox(height: 20),
              ElevatedButton(onPressed: onLoginClicked, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
