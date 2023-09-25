import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbanhub/Custom/Button.dart';

import 'Userdata.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  var height;
  var width;
  var number;


  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  String selectedGender = ''; // Initialize with an empty string
  String name = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  bool isMobileNumberValid = true;
  bool validateMobileNumber(String mobileNumber) {
    // Regular expression for a 10-digit mobile number
    final RegExp mobileNumberRegExp = RegExp(r'\d{10}$');

    return mobileNumberRegExp.hasMatch(mobileNumber);
  }
  void onChangedMobileNumber(String value) {
    setState(() {
      isMobileNumberValid = validateMobileNumber(value);
    });
  }
  bool isEmailvalid = true;

  bool isEmailValid(String email) {
    final RegExp emailRegExp =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  void validateEmail(String email) {
    setState(() {
      isEmailvalid = isEmailValid(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.sizeOf(context).height;
    width=MediaQuery.sizeOf(context).width;
    final iskbcontroller=MediaQuery.of(context).viewInsets.bottom!=0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1D173A),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Container(
                  height: height*0.12,
                  margin: EdgeInsets.only(top: height*0.07),
                  child: Image.asset('assets/images/login.png',fit: BoxFit.fitHeight,)),
              Container(
                padding: EdgeInsets.all(1),
                child: Text('First Name',style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: SizedBox(
                  height: 41,
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white
                    ),
                    controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2)
                    ),),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: Text('Last Name',style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: SizedBox(
                  height: 41,
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white
                    ),
                    controller: lastnameController,
                    decoration: InputDecoration(border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2,)
                    ),),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: Text('Email Address',style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: SizedBox(
                  height: 41,
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white
                    ),
                    controller: emailController,
                    decoration: InputDecoration(
                        errorText: isEmailvalid ? null : 'Invalid email address',
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2,))),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      validateEmail(value);
                    },
                  ),
                ),
              ),Container(
                padding: EdgeInsets.all(1),
                child: Text('Mobile Number',style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child:SizedBox(
                  height: 63,
                  child: IntlPhoneField(
                    style: TextStyle(
                        color: Colors.white
                    ),
                    flagsButtonPadding: const EdgeInsets.all(8),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',

                    onChanged: (phone) {
                      number=phone.completeNumber;
                      print(number);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 70,
                  width: 70,
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: Center(child: Text('Age',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: TextField(
                          style: TextStyle(
                              color: Colors.white
                          ),
                          controller: ageController,
                          decoration: InputDecoration(labelText: 'Age',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white,width: 2))),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 50,
                        margin: EdgeInsets.only(left: 35),
                        child: Center(child: Text('Gender',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                      ),
                      // SizedBox(width: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0,right: 3),
                        child: Center(
                          child: InkWell(
                            onTap: () => selectGender('Male'),
                            child: Column(
                              children: <Widget>[
                                Container(

                                  height:50,
                                  width: 50,
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: selectedGender == 'Male'
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      )
                                  ),
                                  child: Icon(
                                    Icons.male,
                                    size: 30,
                                    color: selectedGender != 'Male'
                                        ? Colors.white
                                        : Color(0xFF1D173A),
                                  ),
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),),
                      ),
                      // SizedBox(width: 20.0),
                      Center(
                        child: InkWell(
                          onTap: () => selectGender('Female'),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height:50,
                                width: 50,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: selectedGender == 'Female'
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    )
                                ),
                                child: Icon(
                                  Icons.female,
                                  size: 30,
                                  color: selectedGender != 'Female'
                                      ? Colors.white
                                      : Color(0xFF1D173A),
                                ),
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height:height*.18,
              ),
              Container(
                width: 126,
                height: 55,
                // margin: EdgeInsets.only(top: height*0.054),
                  child: FuturisticButton(
                    onPressed: () async {
                      name=firstnameController.text+' '+lastnameController.text;
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('name', name);
                      await prefs.setString('number', number);
                      await prefs.setString('email', emailController.text);
                      await prefs.setInt('age', int.parse(ageController.text));
                      await prefs.setString('gender', selectedGender);
                      // Add your button's action here
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => UserDataPage()),
                          (route)=>false,
                      );
                    },
                    child: Text("Save",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Monument Extended',
                          fontSize: 16,
                          color: Colors.white,
                        )
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

