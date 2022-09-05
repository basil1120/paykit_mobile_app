import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:image_picker/image_picker.dart';

class MenuProfile extends StatefulWidget {
  const MenuProfile({Key? key}) : super(key: key);
  @override
  _MenuProfile createState() => _MenuProfile();

}

class _MenuProfile extends State<MenuProfile> {

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late ScaffoldMessengerState scaffoldMessenger;
  int _selectedIndex = 0;
  File? _image;
  String remoteImage = 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  final ImagePicker _picker = ImagePicker();

  final TextEditingController textFieldFirstName = TextEditingController();
  final TextEditingController textFieldLastName = TextEditingController();
  final TextEditingController textFieldPhoneNumber = TextEditingController();
  final TextEditingController textFieldEmailAddress = TextEditingController();

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
        title: const Text('Profile', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 16),),
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
                        children: [
                          const SizedBox(height: 7,),
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey,
                              child: ClipOval(
                                child: SizedBox(
                                  width: 100.0,
                                  height: 100.0,
                                  child: (_image!=null)?Image.file(_image!, fit: BoxFit.fill,
                                  ):Image.network(remoteImage, fit: BoxFit.fill,),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt_outlined, size: 25.0,),
                              onPressed: () async {
                                final XFile? galleryImage = await _picker.pickImage(source: ImageSource.camera);
                                if(mounted) {
                                  setState(() {
                                    _image = galleryImage as File?;
                                    developer.log('Browsed Image Path $_image');
                                  });
                                }
                                //getImage();
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 15.0, right: 12.0),
                            child: TextField(
                              textAlign: TextAlign.left,
                              controller: textFieldFirstName,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                labelText: "First Name",
                                hintText: "First Name",
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
                              controller: textFieldLastName,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                labelText: "Last Name",
                                hintText: "Last Name",
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
                              controller: textFieldEmailAddress,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                labelText: "Email Address",
                                hintText: "Email Address",
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
                                developer.log("*********** Update Account Button CLicked ****");
                              },
                              child: const Text('Update Account',
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
    );
  }
}