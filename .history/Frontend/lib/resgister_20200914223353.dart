import 'dart:io';


import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:image_picker/image_picker.dart';



class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  File _profile, _aadhar;
  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// Select an image via gallery or camera
  Future<void> _pickProfileImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _profile = selected;
    });
  }

  Future<void> _pickAadharImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _aadhar = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xff102733)),
            ),
            Container(
              child: ListView(
                children: [
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                        child: IconButton(
                          icon: Icon(
                            Icons.keyboard_backspace, 
                            color: Colors.yellow[600],
                            size: 30,
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
              //     Row(
              //   children: <Widget>[
              //     Text(
              //       "UVE",
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 25,
              //           fontWeight: FontWeight.w800),
              //     ),
              //     Text(
              //       "NTO",
              //       style: TextStyle(
              //           color: Color(0xffFFA700),
              //           fontSize: 25,
              //           fontWeight: FontWeight.w800),
              //     )
              //   ],
              // ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0,30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Create",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                              ),
                            ),
                            Text(
                              "New Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.yellow[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                  ),
                                ),
                                Text(
                                  "/2",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "Steps",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 40),

                  DottedBorder(
                    color: Colors.yellow[600],
                    padding: EdgeInsets.all(8),
                    dashPattern: [6],
                    borderType: BorderType.Circle,
                    child: Container(
                      height: 180,
                      width: double.maxFinite,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color(0xff102733),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async {
                              await _pickProfileImage(ImageSource.camera);
                            },
                            icon : Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 50
                            ),

                          ),
                          SizedBox(height: 20),
                          IconButton(
                            onPressed: () async {
                              await _pickProfileImage(ImageSource.gallery);
                            },
                            icon : Icon(
                              Icons.photo_library,
                              color: Colors.white,
                              size: 50
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    _profile != null ? _profile.path.split('/').last : "Upload Your Profile Image",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),

                  SizedBox(height: 40),

                  DottedBorder(
                    color: Colors.yellow[600],
                    padding: EdgeInsets.all(8),
                    dashPattern: [6],
                    borderType: BorderType.Circle,
                    child: Container(
                      height: 180,
                      width: double.maxFinite,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color(0xff102733),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async {
                              await _pickAadharImage(ImageSource.camera);
                            },
                            icon : Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 50
                            ),
                          ),
                          SizedBox(height: 20),
                          IconButton(
                            onPressed: () async {
                              await _pickAadharImage(ImageSource.gallery);
                            },
                            icon : Icon(
                              Icons.photo_library,
                              color: Colors.white,
                              size: 50
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Text(
                    _aadhar != null ? _aadhar.path.split('/').last : "Upload Your Aadhar Card",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),

                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 20, 50, 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.yellow[600],//black87,
                        ),
                        child: Center(
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}