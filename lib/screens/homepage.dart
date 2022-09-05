import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:paykit_mobile_app/screens/transaction-detail.dart';

import 'account-cards.dart';
import 'debit-orders.dart';
import 'menu-profile.dart';
import 'menu-track.dart';
import 'menu-transfer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePage createState() => _HomePage();

}

class _HomePage extends State<HomePage> {

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late ScaffoldMessengerState scaffoldMessenger;
  int _selectedIndex = 0;
  bool showBalanceClicked = false;


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

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Want to exit ?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        key: globalKey,
        extendBody: true,
        //**********************************************************************
        // APP-BAR
        //**********************************************************************
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          automaticallyImplyLeading: false,
          //systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 1.0,
          toolbarHeight: 70,
          centerTitle: true,
          flexibleSpace: Container(
            //color: Colors.blue,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
          ),
          actions: [
            Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                    children: [
                      const Text('Hello: Bassam!',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 50),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            //TODO LOGIC
                          },
                          child: const Text('+Add Payment' ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 10)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      IconButton(icon: const Icon(Icons.notifications_none, color: Colors.grey, size: 30,), onPressed: () {
                        setState(() {
                          //counter = 0;
                        });
                      }),
                      SizedBox(
                        //right: 11,
                        //top: 11,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6),),
                          constraints: const BoxConstraints(minWidth: 14, minHeight: 14,),
                          child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
                        ),
                      )
                    ],
                  ),
                ]
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
                      //************************************
                      //************************************
                      //************************************
                      //BASIL CUSTOM HERE
                      //************************************
                      //************************************
                      //************************************
                      Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 120,
                                  color: Colors.blue.shade900,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 15,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                        children: [
                                          GestureDetector(
                                            child:  const Text('HOME', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                            onTap: () {
                                              developer.log('------------------- HOME CLICKED --------');
                                            },
                                          ),
                                          const SizedBox(width: 30),
                                          const Text('|',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            child:  const Text('DEBIT ORDERS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                            onTap: () {
                                              developer.log('------------------- DEBIT ORDERS CLICKED --------');
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DebitOrders()),);
                                            },
                                          ),
                                          const SizedBox(width: 10),
                                          const Text('|',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                          const SizedBox(width: 30),
                                          GestureDetector(
                                            child:  const Text('CARDS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                            onTap: () {
                                              developer.log('------------------- CARDS CLICKED --------');
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AccountCards()),);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Container(
                                //   height: 80,
                                //   color: Colors.white,
                                // )
                              ],
                            ),
                            Container(
                                alignment: Alignment.topCenter,
                                padding: const EdgeInsets.only(top: 70, right: 20.0, left: 20.0),
                                child: SizedBox(
                                  height: 165.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 4.0,
                                    child: Column(
                                      children: [
                                        Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                            const Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: ListTile(
                                                  title: Text('Paykit Wallet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  subtitle: Text('254718908314'),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: ListTile(
                                                  //leading: FlutterLogo(size: 55.0),
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
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            developer.log("************** SHOW BALANCE CLICKED ******");
                                            setState(() {
                                              if(showBalanceClicked){
                                                showBalanceClicked = false;
                                              }else{
                                                showBalanceClicked = true;
                                              }
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.topCenter,
                                            padding:  const EdgeInsets.only(top: 0.0, right: 8.0, left: 8.0, bottom: 0.0),
                                            child:  SizedBox(
                                              height: 52.0,
                                              width: MediaQuery.of(context).size.width,
                                              child:   Card(
                                                color: Colors.grey.shade50,
                                                elevation: 1.0,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                  children: [
                                                    Visibility(
                                                        visible: showBalanceClicked,
                                                        replacement: Row(
                                                          children: [
                                                            const Text('Show Balance'),
                                                            const SizedBox(width: 65,),
                                                            Image.asset('assets/images/visibility.png'),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          children: const [
                                                            Text('Available Balance'),
                                                            SizedBox(width: 65,),
                                                            Text('KES 20,000/='),
                                                          ],
                                                        )
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ]
                      ),

                      //****************** VIEW RECENT TRANSACTIONS
                      Container(
                        alignment: Alignment.topCenter,
                        padding:  const EdgeInsets.only(top: 0.0, right: 20.0, left: 20.0),
                        child:  SizedBox(
                          height: 47.0,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Colors.white,
                            elevation: 4.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                              children: [
                                const Text('VIEW RECENT TRANSACTIONS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                const SizedBox(width: 10,),
                                IconButton(icon: const Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.grey, size: 19.5,), onPressed: () {
                                  setState(() {
                                    developer.log("************** VIEW RECENT TRANSACTIONS CLICKED ******");
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TransactionDetail()),);
                                  });
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //****************** ADVERT SLIDERS
                      Container(
                        height: 150,
                        padding:  const EdgeInsets.only(top: 0.0, right: 20.0, left: 20.0, bottom: 0.0),
                        child: SafeArea(
                          top: false,
                          bottom: false,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                Image.asset('assets/images/advert-loan.png', width: 200, height: 200, fit: BoxFit.contain),
                                const SizedBox(width: 10,),
                                Image.asset('assets/images/advert-loan.png', width: 200, height: 200, fit: BoxFit.contain),
                                const SizedBox(width: 10,),
                                Image.asset('assets/images/advert-loan.png', width: 200, height: 200, fit: BoxFit.contain),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //****************** FREQUENTLY USED
                      const Center(
                        child: Text('FREQUENTLY USED',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Container(
                        color: Colors.grey.shade100,
                        height: 100,
                        child: SafeArea(
                          bottom: false,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60.0,
                                  height: 70.0,
                                  color: Colors.white,
                                  child: Image.asset('assets/images/billers/startimes.png'),
                                ),
                                const SizedBox(width: 20,),
                                Container(
                                  width: 60.0,
                                  height: 70.0,
                                  color: Colors.white,
                                  child: Image.asset('assets/images/billers/zuku.png'),
                                ),
                                const SizedBox(width: 20,),
                                Container(
                                  width: 60.0,
                                  height: 70.0,
                                  color: Colors.white,
                                  child: Image.asset('assets/images/billers/nwc.png'),
                                ),
                                const SizedBox(width: 20,),
                                Container(
                                  width: 60.0,
                                  height: 70.0,
                                  color: Colors.white,
                                  child: Image.asset('assets/images/billers/safaricom.png'),
                                ),
                                const SizedBox(width: 20,),
                                Container(
                                  width: 60.0,
                                  height: 70.0,
                                  color: Colors.white,
                                  child: Image.asset('assets/images/billers/kplc.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      //****************** SERVICE PROVIDERS
                      const Center(
                        child: Text('SERVICE PROVIDERS',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                        ),
                      ),
                      const SizedBox(height: 8,),
                      SafeArea(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 60.0,
                                height: 70.0,
                                color: Colors.white,
                                child: Image.asset('assets/images/billers/startimes.png'),
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                width: 60.0,
                                height: 70.0,
                                color: Colors.white,
                                child: Image.asset('assets/images/billers/zuku.png'),
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                width: 60.0,
                                height: 70.0,
                                color: Colors.white,
                                child: Image.asset('assets/images/billers/nwc.png'),
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                width: 60.0,
                                height: 70.0,
                                color: Colors.white,
                                child: Image.asset('assets/images/billers/safaricom.png'),
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                width: 60.0,
                                height: 70.0,
                                color: Colors.white,
                                child: Image.asset('assets/images/billers/kplc.png'),
                              ),
                            ],
                          ),
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
      ),
    );
  }
}