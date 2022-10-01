
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/account/di/account_service_locator.dart';
import 'package:flutter_mini_project/common/register.dart';

import '../home/presentation/home.dart';

// import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool usernameError = false;
  bool passwordError = false;

  @override
  void initState() {
    username.text = "";
    password.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final usernameField = TextFormField(
      cursorColor: Colors.redAccent,
      autofocus: false,
      controller: username,
      decoration:  InputDecoration(
        errorText: usernameError ? "Invalid username" : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  const BorderSide(color: Colors.pinkAccent ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  const BorderSide(color: Colors.pinkAccent ),
        ),
        focusColor: Colors.red,
        border: const OutlineInputBorder(),
        // icon: Icon(Icons.account_circle_outlined)
        prefixIcon: const Icon(Icons.account_circle_outlined, color: Colors.redAccent,)
      ),
    );

    final passwordField = TextFormField(
      cursorColor: Colors.redAccent,
      autofocus: false,
      obscureText: true,
      controller: password,
      decoration:  InputDecoration(
        errorText: passwordError ? "Invalid password" : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  const BorderSide(color: Colors.pinkAccent ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  const BorderSide(color: Colors.pinkAccent ),
        ),
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.shopping_bag_outlined, color: Colors.redAccent,)
      ),
    );

    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.red, 
                      fontSize: 32.0, 
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.italic
                      ), 
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                  child: Text('Username'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 5.0),
                  child: usernameField,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                  child: Text('Password'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
                  child: passwordField,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                      child: TextButton(
                        onPressed: () {}, 
                        child: const Text('Forgot Password?', style: TextStyle(color: Colors.redAccent),)
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[400],
                          ),
                          onPressed: () async {
                            (validateUsername()) ? {
                              setState(() {
                                usernameError = true;
                              })} : usernameError = false;
                            
                            (validatePassword()) ? {
                              setState(() {
                                passwordError = true;
                              })
                            } :  passwordError = false;

                            if((!usernameError && !passwordError)){
                              try {
                                final user = await accountRepository.getUser(username.text, password.text);
                                setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Home()),
                                );
                              });
                              } on Exception catch(e) {
                                print(e);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                              }
                             
                            }
                          },
                          child:  const Text('Login')
                        ),
                      ),
                    ),
                  ],
                ),
                const Center(child: Text('or', style: TextStyle(fontFamily: 'Lobster', color: Colors.red),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
                        ),
                        onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                        },
                        child:  const Text('Sign up')
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const SizedBox(height: 20.0,),
                )
              ],
            ),
          ),
        ),
      ));
  }

  bool validatePassword() => password.text.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password.text) || password.text.length < 8;

  bool validateUsername() => username.text.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(username.text) || username.text.length < 4;
}
