import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'debit-orders-create-phone.dart';
import 'menu-profile.dart';
import 'menu-track.dart';
import 'menu-transfer.dart';

class DebitOrders extends StatefulWidget {
  const DebitOrders({Key? key}) : super(key: key);
  @override
  _DebitOrders createState() => _DebitOrders();

}

class _DebitOrders extends State<DebitOrders> {

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
        title: const Text('Debit Orders', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 16),),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30,),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  developer.log("Notification Button Clicked");
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/icon-cash-debit1.png', width: 145, height: 100,),
                    ),

                    const SizedBox(height: 25,),
                    Center(
                      child: Column(
                        children: [
                          const Text('No debit order set for now',style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),

                          const SizedBox(height: 30,),

                          const Text('Click “add new” to set a debit order where your desired payment will be done at your desired time and way',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal,),
                              textAlign: TextAlign.center,
                          ),


                          const SizedBox(height: 50,),
                          Container(
                            height: 45,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.green.shade500,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextButton(
                              onPressed: () {
                                developer.log("*********** Add New Button CLicked ****");
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DebitOrdersCreate()),);
                              },
                              child: const Text('+Add New',
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