import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'menu-profile.dart';
import 'menu-track.dart';
import 'menu-transfer.dart';

class AccountCards extends StatefulWidget {
  const AccountCards({Key? key}) : super(key: key);
  @override
  _AccountCards createState() => _AccountCards();

}

class _AccountCards extends State<AccountCards> {

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late ScaffoldMessengerState scaffoldMessenger;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      developer.log(index.toString());
    });
    if(index == 2){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MenuProfile()),);
    }else if(index == 1){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MenuTrack()),);
    }else if(index == 0){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MenuTransfer()),);
    }
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
        title: const Text('Cards', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 16),),
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
                    //body details
                    const SizedBox(height: 25,),
                    Center(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset('assets/images/icon-warn-alert.png', width: 145, height: 100,),
                          ),

                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('No registered virtual card',
                              style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          const SizedBox(height: 10,),
                          Container(
                            height: 45,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextButton(
                              onPressed: () {
                                developer.log("*********** Create Card Button CLicked ****");
                              },
                              child: const Text('Create Card',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
      ),



      //**********************************************************************
      // BOTTOM NAVIGATION
      //**********************************************************************
      bottomNavigationBar: Container(
          height: 83,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(22), topLeft: Radius.circular(22)),
            boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(22.0), topRight: Radius.circular(22.0),),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue.shade900,
              unselectedItemColor: Colors.white,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.compare_arrows_outlined, color: Colors.white,),
                  label: 'Transfer',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart, color: Colors.white,),
                  label: 'Track',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white,),
                  label: 'Account',
                  backgroundColor: Colors.white,),
              ],
              onTap: _onItemTapped,
            ),
          )
      ),
    );
  }
}