import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paykit_mobile_app/screens/onboarding.dart';
import 'package:paykit_mobile_app/screens/account-cards.dart';
import 'package:paykit_mobile_app/screens/debit-orders-create-phone.dart';
import 'package:paykit_mobile_app/screens/debit-orders.dart';
import 'package:paykit_mobile_app/screens/transaction-detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Paykit',
      theme: ThemeData(
        dividerColor: const Color(0xFFECEDF1),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColor: Colors.blue.shade900,
        //primarySwatch:  Colors.blue,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          subtitle2: TextStyle(fontSize: 16.0),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          headline4: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat', color: Colors.black54),
          headline3: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat', color: Colors.black54),
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue[900]),
      ),
      home: const OnBoardingPage(),
      //home: const TransactionDetail(),
      //home : const DebitOrders(),
      //home : const DebitOrdersCreate(),
      //home: const AccountCards(),
      debugShowCheckedModeBanner: false,
    );
  }
}
