import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/resource/invoice_api_proivder.dart';
import 'package:ss/src/resource/login_api_provider.dart';
import 'package:ss/src/ui/widgets/my_button.dart';
import 'package:ss/src/ui/widgets/my_text_form_field.dart';

import 'home_page.dart';

InvoiceApiProvider apiProvider = InvoiceApiProvider();
LoginApiProvider loginApiProvider = LoginApiProvider();

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static String tag = 'login-page';
  final _formKey = GlobalKey<FormState>();
  late String _username, _password;

  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _restoreUsernameAndPassword();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      ('assets/icon/phabis2.png'),
      height: 170.0,
      fit: BoxFit.fitHeight,
    );
    final username = MyTextFormField(
      label: 'корисничко име',
      controller: _usernameTextController,
      validator: (val) => val!.isEmpty ? 'внесете го корисничкото име' : null,
      onSaved: (val) => _username = val!,
      autofocus: true,
      inputFormatter: const [],
    );
    final password = MyTextFormField(
      label: 'шифра',
      controller: _passwordTextController,
      obscureText: true,
      validator: (val) => val!.isEmpty ? 'внесете ја шифрата' : null,
      onSaved: (val) => _password = val!,
      inputFormatter: [],
    );
    final loginButton =
        MyButton(label: 'ПРИЈАВУВАЊЕ', onPressed: () => submit());

    return Center(
        child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[logo]),
                const SizedBox(height: 48.0),
                username,
                const SizedBox(height: 8.0),
                password,
                const SizedBox(height: 24.0),
                loginButton,
              ],
            )));
  }

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      bool correct = await loginApiProvider.login(_username,_password);
      print("BOOL: "  + correct.toString());
     if(correct && mainToken != null){
       _rememberUsernameAndPassword();
       redirectToHome();
     }else{
       _loginErrorDialog();
     }
    }
  }
  void redirectToHome(){
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  Future<void> _loginErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Грешка при пријавувањето'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Погрешно корисничко име или шифра. Обидете се повторно.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Во ред'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _restoreUsernameAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _password = prefs.getString('password') ?? '';
      _usernameTextController.text = _username;
      _passwordTextController.text = _password;
    });
  }

  void _rememberUsernameAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _username);
    await prefs.setString('password', _password);
  }
}
