import 'package:flutter/material.dart';

import '../home/presentation/home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool usernameError = false;
  bool emailError = false;
  bool passwordError = false;
  bool confirmPasswordError = false;

  @override
  void initState() {
    username.text = "";
    email.text = "";
    password.text = "";
    confirmPassword.text = "";
    super.initState();
  }
  
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {

    final usernameField = TextFormField(
      cursorColor: Colors.redAccent,
      autofocus: false,
      controller: username,
      decoration: InputDecoration(
        errorText: usernameError ? "Invalid username" : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.pinkAccent ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.pinkAccent ),
        ),
        focusColor: Colors.red,
        border: const UnderlineInputBorder(),
        labelText: 'Username',
        labelStyle: const TextStyle(color: Colors.redAccent, fontSize: 14.0)
      ),
    );

    final emailField = TextFormField(
      cursorColor: Colors.redAccent,
      autofocus: false,
      controller: email,
      decoration: InputDecoration(
        errorText: emailError ? "Invalid email" : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.pinkAccent ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.pinkAccent ),
        ),
        focusColor: Colors.red,
        border: const UnderlineInputBorder(),
        labelText: 'Email Address',
        labelStyle: const TextStyle(color: Colors.redAccent, fontSize: 14.0)
      ),
    );

    final passwordField = TextFormField(
      cursorColor: Colors.redAccent,
      autofocus: false,
      obscureText: true,
      controller: password,
      decoration: InputDecoration(
        errorText: passwordError ? "Invalid password" : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.pinkAccent ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.pinkAccent ),
        ),
        focusColor: Colors.red,
        border: const UnderlineInputBorder(),
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.redAccent, fontSize: 14.0)
      ),
    );

    final confirmPasswordField = TextFormField(
      cursorColor: Colors.redAccent,
      autofocus: false,
      obscureText: true,
      controller: confirmPassword,
      decoration: InputDecoration(
        errorText: confirmPasswordError ? "Password don't match" : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.pinkAccent ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.pinkAccent ),
        ),
        focusColor: Colors.red,
        border: const UnderlineInputBorder(),
        labelText: 'Password (confirm)',
        labelStyle: const TextStyle(color: Colors.redAccent, fontSize: 14.0)
      ),
    );

    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.red, 
                    fontSize: 32.0, 
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic
                    ), 
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: usernameField,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child: emailField,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child: passwordField,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child: confirmPasswordField,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        checkColor: Colors.red[400],
                        activeColor: Colors.red[200],
                        value: checkedValue, 
                        onChanged: (value) {
                          setState(() {
                            checkedValue = !checkedValue;
                          });
                        }),
                    ),
                    const Text('I have read and accept terms and conditions.', style: TextStyle(fontSize: 12.0),)
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
                        ),
                onPressed: () {
                  (validateUsername()) ? {
                    setState(() {
                      usernameError = true;
                    })} : usernameError = false;
                  
                  (validateEmail()) ? {
                    setState(() {
                      emailError = true;
                    })
                  } :  emailError = false;

                  (validatePassword()) ? {
                    setState(() {
                      passwordError = true;
                    })
                  } :  passwordError = false;

                  (password.text != confirmPassword.text) ? {
                    setState(() {
                      confirmPasswordError = true;
                    })
                  } :  confirmPasswordError = false;                  

                  if((!usernameError && !passwordError && !emailError && !confirmPasswordError && checkedValue)){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  }
                }, 
                child: const Text('Submit')
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validatePassword() => password.text.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password.text) || password.text.length < 8;

  bool validateEmail() => email.text.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text);

  bool validateUsername() => username.text.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(username.text) || username.text.length < 4;
}