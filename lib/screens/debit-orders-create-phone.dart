import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:developer' as developer;

import '../widgets/dropdown-debit-orders/drop_list_model.dart';
import '../widgets/dropdown-debit-orders/select_drop_list.dart';
import 'menu-profile.dart';
import 'menu-track.dart';
import 'menu-transfer.dart';

class DebitOrdersCreate extends StatefulWidget {
  const DebitOrdersCreate({Key? key}) : super(key: key);
  @override
  _DebitOrdersCreate createState() => _DebitOrdersCreate();

}

class _DebitOrdersCreate extends State<DebitOrdersCreate> {

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late ScaffoldMessengerState scaffoldMessenger;
  int _selectedIndex = 0;
  bool isSwitched = false;

  final TextEditingController textFieldDebitName = TextEditingController();
  final TextEditingController textFieldPhoneNumber = TextEditingController();
  final TextEditingController textFieldAmount = TextEditingController();

  DropListModel dropListModel = DropListModel(
      [ OptionItem(id: "1", title: "To Mobile"),
        OptionItem(id: "2", title: "To Bank")
      ]);
  OptionItem optionItemSelected = OptionItem(id: "0", title: "Select Destination");

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
                    const SizedBox(height: 25,),
                    Center(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('What method do you want the order to be made to ?',
                              style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 15.0, right: 12.0),
                            child: SelectDropList(
                              optionItemSelected,
                              dropListModel,
                                  (optionItem){
                                optionItemSelected = optionItem;
                                setState(() {

                                });
                              },
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 15.0, right: 12.0),
                            child: TextField(
                              textAlign: TextAlign.left,
                              controller: textFieldDebitName,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                labelText: "Debit Name",
                                hintText: "Debit Name",
                                //prefixIcon: const Icon(Icons.phone_iphone),
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 15.0, right: 12.0),
                            child: TextField(
                              textAlign: TextAlign.left,
                              controller: textFieldPhoneNumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                labelText: "Phone Number",
                                hintText: "Phone Number",
                                suffixIcon: const Icon(Icons.account_box),
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 15.0, right: 12.0),
                            child: TextField(
                              textAlign: TextAlign.left,
                              controller: textFieldAmount,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                labelText: "Amount",
                                hintText: "Amount",
                                //prefixIcon: const Icon(Icons.phone_iphone),
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

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 15.0, right: 12.0),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Text('Select Debit Date'),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(padding: const EdgeInsets.all(0.0),
                                    child: GestureDetector(
                                      onTap:() {
                                        DatePicker.showDatePicker(context, showTitleActions: true,
                                            minTime: DateTime(2022, 7, 28),
                                            maxTime: DateTime(2050, 7, 28), onChanged: (date) {
                                              developer.log('--------- DATE change $date');
                                            }, onConfirm: (date) {
                                              developer.log('--------- DATE confirm $date');
                                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        padding:  const EdgeInsets.only(top: 0.0, right: 8.0, left: 8.0, bottom: 0.0),
                                        child:  SizedBox(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const Text('28-07-2022', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),),
                                                IconButton(icon: const Icon(Icons.calendar_month, color: Colors.black, size: 22,),
                                                  onPressed: () {
                                                    developer.log("++++++++ Date Icon Clicked");
                                                  },
                                                ),
                                              ],
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),


                          Padding(
                              padding: const EdgeInsets.only(bottom: 0.0, left: 15.0, right: 0.0, top: 4),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Text('Recurring'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                          });
                                        },
                                        activeTrackColor: Colors.lightBlueAccent,
                                        activeColor: Colors.blue.shade900,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),




                          const SizedBox(height: 10,),
                          Container(
                            height: 45,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.green.shade500,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextButton(
                              onPressed: () {
                                developer.log("*********** Process Button CLicked ****");
                              },
                              child: const Text('Process',
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