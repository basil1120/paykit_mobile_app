import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'homepage.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController phoneNumberController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  final GlobalKey<ScaffoldState>_scaffoldKey = GlobalKey();

  void _showErrorSnackBar(String errorMessage){
    scaffoldMessenger.showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          content: SizedBox(
            height: 30.0,
            child: Text(errorMessage),
          ),
        )
    );
  }

  void _showWarningSnackBar(String errorMessage){
    scaffoldMessenger.showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.orange,
          content: SizedBox(
            height: 30.0,
            child: Text(errorMessage),
          ),
        )
    );
  }

  void _showSuccessSnackBar(String errorMessage){
    scaffoldMessenger.showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
          content: SizedBox(
            height: 30.0,
            child: Text(errorMessage),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/logo.jpeg')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Create A PayKit Wallet Account", style: Theme.of(context).textTheme.subtitle2
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 24.0, right: 24.0),
              child: TextField(
                textAlign: TextAlign.left,
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).dividerColor,
                  labelText: "Mobile",
                  hintText: "Mobile",
                  prefixIcon: const Icon(Icons.phone_iphone),
                  hintStyle: Theme.of(context).textTheme.headline3,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "By creating an account you accept our",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Terms of use & Privacy Policy",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            const SizedBox(height: 18,),
            Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage()),);
                },
                child: const Text('NEXT',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String message) {
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}