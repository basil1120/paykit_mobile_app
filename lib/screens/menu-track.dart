import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class MenuTrack extends StatefulWidget {
  const MenuTrack({Key? key}) : super(key: key);
  @override
  _MenuTrack createState() => _MenuTrack();

}

class _MenuTrack extends State<MenuTrack> {

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late ScaffoldMessengerState scaffoldMessenger;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: globalKey,
      extendBody: true,
      //**********************************************************************
      // APP-BAR
      //**********************************************************************
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(16),),),
        title: const Text('Track', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 16),),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30,),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.notifications_none, color: Colors.white, size: 30,),
              )
          ),
        ],
      ),
      //**********************************************************************
      // BODY
      //**********************************************************************
      body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width *1,
              height: MediaQuery.of(context).size.height *1,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Coming Soon !!!',
                              style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}