import 'package:flutter/material.dart';
import 'package:forms/utilities/form_validators.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Forms'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool autoValidate = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            autovalidate: autoValidate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  validator: emailValidator,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    labelText: 'Email'
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _passwordController,
                  validator: passwordValidator,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: 'Password'
                  ),
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: _login,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Login successful');
      print(_emailController.text);
      print(_passwordController.text);
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }
}
