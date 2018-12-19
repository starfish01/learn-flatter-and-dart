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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            margin: EdgeInsets.all(10.0),
            child: ListView(children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: const Icon(Icons.email))),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Icon(Icons.lock,
                            color: Theme.of(context).primaryColor))),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SwitchListTile(
                  value: _acceptTerms,
                  title: Text('Accept Terms'),
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = !_acceptTerms;
                    });
                  }),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  _showExitDialog(context);
                },
              ),
            ])));
  }
}
