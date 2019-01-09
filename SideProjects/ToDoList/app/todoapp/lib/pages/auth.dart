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
          color: Color.fromRGBO(113,199,236, 1.0)
            // image: _buildBackgroundImage(),
            ),
        // padding: EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                    color: Color.fromRGBO(113,199,236, 1.0)
                  ),
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
                    color: Color.fromRGBO(24,154,211,1.0),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minWidth: deviceWidth,
                    minHeight: 30.0
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0,80,115, 1.0)
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minWidth: deviceWidth,
                    minHeight: deviceWidth
                  ),
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(113,199,236, 1.0)
                  // ),
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
