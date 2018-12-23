import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _authFormData = {"email": null, "password": null,"terms":false};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'E-Mail', filled: true, fillColor: Colors.white),
        keyboardType: TextInputType.emailAddress,
        validator: (String value){
          if(value.isEmpty || !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)){
            return "Please enter a vaild Email";
          }
        },
        onSaved: (String value) {
          _authFormData['email'] = value;
        });
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value){
        if(value.isEmpty || value.trim().length <= 5){
          return "Password must be at least 5 Characters long";
        }
      },
      onSaved: (String value) {
        
          _authFormData['password'] = value;
        
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _authFormData['terms'],
      onChanged: (bool value) {
        setState(() {
          _authFormData['terms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() || !_authFormData['terms']) {
      return;
    }
    _formKey.currentState.save();

    print(_authFormData['email'] );
    print(_authFormData['password'] );
    print(_authFormData['terms'] );
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    // final double deviceWidth = MediaQuery.of(context).size.width;
    // final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              image: _buildBackgroundImage(),
            ),
            padding: EdgeInsets.all(10.0),
            child: Container(
                child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
                  _buildAcceptSwitch(),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    child: Text('LOGIN'),
                    onPressed: _submitForm,
                  ),
                ],
              ),
            )),
          ),
        ));
  }
}
