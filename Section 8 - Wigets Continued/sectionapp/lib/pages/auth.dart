import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  String _password = '';
  String _email = '';
  bool _acceptTerms = false;

  _buildBackgroundImage() {
    return BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage('assets/background.jpg')));
  }

  _showExitDialog(BuildContext context) {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Details'),
            content: Text('Email: ' + _email + ' Password: ' + _password),
            actions: <Widget>[
              FlatButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
          );
        },
        context: context);
  }

  _emailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Email',
          filled: true,
          fillColor: Colors.white,
          icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.email))),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  _passwordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password',
          filled: true,
          fillColor: Colors.white,
          icon: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Icon(Icons.lock, color: Theme.of(context).primaryColor))),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  _termsAndConditionsSwitch() {
    return SwitchListTile(
        value: _acceptTerms,
        title: Text('Accept Terms'),
        onChanged: (bool value) {
          setState(() {
            _acceptTerms = !_acceptTerms;
          });
        });
  }

  _submitLoginDetailsButton() {
    return RaisedButton(
      child: Text('Login'),
      onPressed: () {
        _showExitDialog(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth =  MediaQuery.of(context).size.width;
    final double targetWitdth = deviceWidth > 555.0 ? 500 : deviceWidth * 0.95;

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            decoration: _buildBackgroundImage(),
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: SingleChildScrollView(
                    child: Container(
                      width: targetWitdth,
                        child: Column(children: <Widget>[
              _emailTextField(),
              SizedBox(
                height: 10,
              ),
              _passwordTextField(),
              _termsAndConditionsSwitch(),
              SizedBox(
                height: 10.0,
              ),
              _submitLoginDetailsButton()
            ]))))));
  }
}
