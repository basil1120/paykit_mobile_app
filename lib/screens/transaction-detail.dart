import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'menu-profile.dart';
import 'menu-track.dart';
import 'menu-transfer.dart';

class TransactionDetail extends StatefulWidget {
  const TransactionDetail({Key? key}) : super(key: key);
  @override
  _TransactionDetail createState() => _TransactionDetail();

}

class _TransactionDetail extends State<TransactionDetail> {

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
          title: const Text('Transaction Details', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    developer.log("********** Notification Clicked *******");
                  },
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
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/icon-success.png', width: 145, height: 100,),
                      ),
                      const Center(
                          child: Text('Success',style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)
                      ),
                      Center(
                        child: Container(
                          padding:  const EdgeInsets.only(top: 0.0, right: 8.0, left: 8.0, bottom: 0.0),
                          child:  SizedBox(
                            height: 52.0,
                            width: MediaQuery.of(context).size.width - 150,
                            child:   Card(
                              color: Colors.grey.shade100,
                              elevation: 0.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Ksh. 3,500.00', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: ListTile(
                                leading: ConstrainedBox(
                                  constraints:  const BoxConstraints(
                                    minWidth: 90,
                                    minHeight: 75,
                                    maxWidth: 90,
                                    maxHeight: 75,
                                  ),
                                  child: Image.asset('assets/images/logo-1.png', fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          //******
                          const SizedBox(width: 10,),
                          const Icon(Icons.arrow_forward, color: Colors.blue, size: 30,),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: ListTile(
                                leading: ConstrainedBox(
                                  constraints:  const BoxConstraints(
                                    minWidth: 90,
                                    minHeight: 75,
                                    maxWidth: 90,
                                    maxHeight: 75,
                                  ),
                                  child: Image.asset('assets/images/icon-mpesa.png', fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Divider(thickness: 2.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: ListTile(
                                title: Text('Basil Bassam', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                subtitle: Text('+254718908314'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: ListTile(
                                title: Text('John Doe', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                subtitle: Text('+254700000001'),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Divider(thickness: 2.0,),
                      const Center(
                          child: Text('Transaction Details',style: TextStyle(color: Colors.black, fontSize: 12),)
                      ),

                      Column(
                        crossAxisAlignment : CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Ref Number :'),
                              SizedBox(width: 55,),
                              Text('REF134567876543')
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Recepient :'),
                              SizedBox(width: 55,),
                              Text('John Doe')
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Date :'),
                              SizedBox(width: 55,),
                              Text('28-JUL-2022')
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Time :'),
                              SizedBox(width: 55,),
                              Text('5:42pm')
                            ],
                          ),
                        ],
                      ),

                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  developer.log("********** Share Button Clicked *******");
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue // set the background color
                                ),
                                child: const Text("Share"),
                              ),
                            ),
                            const SizedBox(width: 32,),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  developer.log("********** Download Button Clicked *******");
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue.shade900 // set the background color
                                ),
                                child: const Text("Download"),
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ]
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