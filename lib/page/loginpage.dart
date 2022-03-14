import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebasedemo/page/registerpage.dart';
import 'package:firebasedemo/services/auth_service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            text1(),
            subtext(),
            email(),
            password(),
            signinbutton(),
            googlebutton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text2(),
                register(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget text2() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do not Have an Account?',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget text1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 120, 35, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget subtext() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Signin with your email and password \nor continue with Google',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget email() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          prefixIcon: Icon(
            Icons.email_rounded,
            color: Colors.blue,
          ),
          label: Text(
            'E-mail',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget password() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
      child: TextFormField(
        controller: _password,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          prefixIcon: Icon(
            Icons.lock_rounded,
            color: Colors.blue,
          ),
          label: Text(
            'Password',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget signinbutton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 2),
      child: SizedBox(
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            onPressed: () async {
              setState(() {
                loginUser(_email.text, _password.text);
              });
              if (_formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                var result = await loginUser(email, password);

                if (result = loginUser(email, password) == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Singin Successful!')));
                  Navigator.pop(context, true);
                } else {
                  if (result = loginUser(email, password) == null) ;
                }
              }
            },
            child: const Text(
              'Signin with email',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }

  Widget register() {
    return SizedBox(
      child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 10, 123, 216)),
          ),
          onPressed: () {
            var route = MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            );
            Navigator.push(context, route);
          },
          child: const Text(
            'Register',
            style: TextStyle(fontSize: 15),
          )),
    );
  }

  Widget googlebutton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: SizedBox(
        child: GoogleAuthButton(
          style:
              AuthButtonStyle(borderRadius: 32, buttonColor: Colors.blue[100]),
          onPressed: () {
            signInWithGoogle();
          },
          darkMode: false,
        ),
      ),
    );
  }
}
