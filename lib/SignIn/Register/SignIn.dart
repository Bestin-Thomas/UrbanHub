import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:urbanhub/Custom/Button.dart';
import 'package:urbanhub/SignIn/Register/Verify.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  var height;
  var width;
  var number;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.sizeOf(context).height;
    width=MediaQuery.sizeOf(context).width;
    final iskbcontroller=MediaQuery.of(context).viewInsets.bottom!=0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1D173A),
      body: Column(
          children: [
              Container(
                  height: height*0.12,
                  margin: EdgeInsets.only(top: height*0.10),
                  child: Image.asset('assets/images/login.png',fit: BoxFit.fitHeight,)),
            SizedBox(
              height: iskbcontroller!? height*.05:height*.25
            ),
            Container(
              margin: EdgeInsets.only(left: height*.020,right: height*.21),
              child: Text(
                'Sign in / Register',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'Monument Extended',
                  shadows: [
                    Shadow(
                      color: Color(0x40000000), // Shadow color
                      offset: Offset(0, 4), // Shadow offset (dx, dy)
                      blurRadius: 4, // Shadow blur radius
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: height*.02,right: height*.289),
              child: Text(
                'Mobile Number',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: 'Monument Extended',
                  shadows: [
                    Shadow(
                      color: Color(0x40000000), // Shadow color
                      offset: Offset(0, 4), // Shadow offset (dx, dy)
                      blurRadius: 4, // Shadow blur radius
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: height*.02,right: height*.02),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Container(// Replace with your image path
                width: 180,
                height: 55,
                // margin: EdgeInsets.only(top: height*0.054),
                child: FuturisticButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => verify()),
                  );
                },
                  child: Text("Send OTP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Monument Extended',
                        fontSize: 16,
                        color: Colors.white,
                      )
                  ),
                  width: 180,
                ),
              ),
            )


          ],
        ),
    );
  }
}
