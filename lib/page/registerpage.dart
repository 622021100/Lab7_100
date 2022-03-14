import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebasedemo/page/registerpage.dart';
import 'package:firebasedemo/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // final TextEditingController _username = TextEditingController();

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
            registerbutton(),
            // googlebutton(),
          ],
        ),
      ),
    );
  }

  // Widget text2() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           'Do not Have an Account?',
  //           style: TextStyle(
  //             fontSize: 15,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget text1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 120, 35, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Register',
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
            'Register with your email and password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // Widget uaername() {
  //   return Container(
  //     margin: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
  //     child: TextFormField(
  //       controller: _username,
  //       keyboardType: TextInputType.emailAddress,
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return 'Please Enter Your Username';
  //         }
  //         return null;
  //       },
  //       decoration: const InputDecoration(
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(32)),
  //           borderSide: BorderSide(color: Colors.blue, width: 2),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(32)),
  //           borderSide: BorderSide(color: Colors.blue, width: 2),
  //         ),
  //         errorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(32)),
  //           borderSide: BorderSide(color: Colors.red, width: 2),
  //         ),
  //         prefixIcon: Icon(
  //           Icons.email_rounded,
  //           color: Colors.blue,
  //         ),
  //         label: Text(
  //           'Username',
  //           style: TextStyle(color: Colors.blue),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget email() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your E-mail';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.red, width: 2),
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your Password';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.red, width: 2),
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

  Widget registerbutton() {
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
            onPressed: () {
              registerWithEmail(_email.text, _password.text);
            },
            child: const Text(
              'Register ',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }

  // Widget registerbutton() {
  //   return SizedBox(
  //     child: TextButton(
  //         style: ButtonStyle(
  //           foregroundColor: MaterialStateProperty.all<Color>(
  //               Color.fromARGB(255, 10, 123, 216)),
  //         ),
  //         onPressed: () {
  //           var route = MaterialPageRoute(
  //             builder: (context) => const RegisterPage(),
  //           );
  //           Navigator.push(context, route);
  //         },
  //         child: const Text(
  //           'Register',
  //           style: TextStyle(fontSize: 15),
  //         )),
  //   );
  // }

  // Widget googlebutton() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
  //     child: SizedBox(
  //       child: GoogleAuthButton(
  //         style:
  //             AuthButtonStyle(borderRadius: 32, buttonColor: Colors.blue[100]),
  //         onPressed: () {
  //           signInWithGoogle();
  //         },
  //         darkMode: false,
  //       ),
  //     ),
  //   );
  // }
}
