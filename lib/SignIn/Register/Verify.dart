import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:urbanhub/Custom/Button.dart';
import 'package:urbanhub/SignIn/Register/Register.dart';

import 'SignIn.dart';

class verify extends StatefulWidget {
  const verify({super.key});

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify>{
  // var controller = new MaskedTextController(mask: '(000) 000 0000');
  var height;
  var width;
  var number;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.sizeOf(context).height;
    width=MediaQuery.sizeOf(context).width;
    final iskbcontroller=MediaQuery.of(context).viewInsets.bottom!=0;
    return Scaffold(
      backgroundColor: Color(0xFF1D173A),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: height*0.067,
            ),
            IconButton(onPressed: (){
              Navigator.pop(context);
            },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              padding: EdgeInsets.only(left: 0,right: height*.4),),

            Container(
                height: height*0.12,
                child: Image.asset('assets/images/login.png',fit: BoxFit.fitHeight,)),
            SizedBox(
                height: iskbcontroller!? height*.07:height*.3
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OtpTextField(
                numberOfFields: 4,
                textStyle: TextStyle(
                  color: Colors.white
                ),
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
            ),
            Container( // Replace with your image path
              width: 150,
              height: 55,
              margin: iskbcontroller!? EdgeInsets.only(top: height*.02):EdgeInsets.only(top: height*.05),
              // margin: EdgeInsets.only(top: height*0.054),
              child: FuturisticButton(
                  onPressed: () {

                    // Add your button's action here
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => register()),
                        (route)=>false,
                    );
                  },
                  child: Text("Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Monument Extended',
                        fontSize: 16,
                        color: Colors.white,
                      )
                  ),
                width: 146,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
