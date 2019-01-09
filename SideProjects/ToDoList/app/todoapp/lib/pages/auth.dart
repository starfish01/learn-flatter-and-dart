import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  //final Color primaryColor;
  //final Color backgroundColor;

  AuthPage();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // image: _buildBackgroundImage(),
            ),
        // padding: EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: Container(
            // margin: EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment(-0.6, 0),
                  constraints: BoxConstraints(
                      maxHeight: 200,
                      minWidth: MediaQuery.of(context).size.width),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 45, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                )
              ],
            ),

            // width: targetWidth,
            // child: Form(key: _formKey, child: null,
          ),
        ),
      ),
    );
  }
}
