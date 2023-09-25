
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbanhub/Custom/Button.dart';
import 'package:urbanhub/SignIn/Register/SignIn.dart';

import 'Register.dart';

class UserDataPage extends StatefulWidget {
  @override
  _UserDataPageState createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {

  int _currentIndex=0;

  var height;
  var width;
  String name = '';
  String number = '';
  String email = '';
  int age = 0;
  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      number = prefs.getString('number') ?? '';
      email = prefs.getString('email') ?? '';
      age = prefs.getInt('age') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.sizeOf(context).height;
    width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1D173A),
      body: Container(
        height: height,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: height*.03,
            ),
            Container(
              height: 60, // Set t
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:EdgeInsets.only(left: 0,right: width*.23),
                    child: IconButton(
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => register()),
                                (route)=>false,
                          );
                        },
                        icon: Icon(Icons.arrow_back,color: Colors.white,
                        )
                    ),
                  ),
                  Container(
                    height: height*.0338,

                    child: Image.asset('assets/images/volume.png'),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: height*.05),
              width: 55,
              height: 55,
              // child: Image.asset('assets/icons/profile.png',fit: BoxFit.fitHeight,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage('assets/icons/profile.png'),fit: BoxFit.fitHeight)
              ),
            ),
            Container(
              height: 19,
              margin: EdgeInsets.only(top: 5),
              child: Text(
                '$name',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: 'Monument Extended',
                  height: 1.25, // Equivalent to 19sp line height
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    child: Text('$number',style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Container(
                      height: 20,
                      width: 0.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                          left: BorderSide(
                            width: 2.0, // Set this to your desired stroke width
                            color: Colors.white, // Set your desired stroke color
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: Text('$email',style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'Inter',
                      height: 1.0, // Line height is identical to box height
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                elevation: 0, // Shadow elevation// Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Button border radius
                ),
              ),
              onPressed: () {
                print('Edit Profile');
                // Add your button click logic here
              },
              child: Container(
                width: width*0.88,
                height: 50.0,
                decoration:BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7B61FF),  Color(0xFF3D3373)], // Define your gradient colors
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter, // Optional: Define stops to control color distribution
                ),
                  // image: DecorationImage(image: AssetImage("assets/icons/edit.png")),
                  borderRadius: BorderRadius.circular(10.0),
              ),
                child:Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset('assets/icons/edit.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4,left: 4,bottom: 4),
                      child: Text('Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                    )
                  ],
                )
                // Image.asset('assets/icons/edit.png',),
                // alignment: Alignment.start,
                ),
              ),
            SizedBox(height: height*.02), // Adjust spacing as needed
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                elevation: 0, // Shadow elevation// Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Button border radius
                ),
              ),
              onPressed: () {
                print('My Package');
                // Add your button click logic here
              },
              child: Container(
                width: width*0.88,
                height: 50.0,
                decoration:BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7B61FF),  Color(0xFF3D3373)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,// Define your gradient colors
                  // Optional: Define the end point
                   // Optional: Define stops to control color distribution
                ),
                  borderRadius: BorderRadius.circular(10.0),
              ),
                  child:Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset('assets/icons/package.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4,left: 4,bottom: 4),
                        child: Text('My Package',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),),
                      )
                    ],
                  )
              ),
            ),
            SizedBox(height: height*.02), // Adjust spacing as needed
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                elevation: 0, // Shadow elevation// Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Button border radius
                ),
              ),
              onPressed: () {
                print('Change Mobile');
                // Add your button click logic here
              },
              child: Container(
                width: width*0.88,
                height: 50.0,
                decoration:BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7B61FF),  Color(0xFF3D3373)], // Define your gradient colors
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,// Optional: Define stops to control color distribution
                ),
                  borderRadius: BorderRadius.circular(10.0),
              ),
                  child:Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset('assets/icons/mobile.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4,left: 4,bottom: 4),
                        child: Text('Change Mobile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),),
                      )
                    ],
                  )
              ),
            ),
            SizedBox(
              height: height*.25,
            ),
            Container(
              height: 55,
              // margin: EdgeInsets.only(top: height*0.054),
              child: FuturisticButton(
                onPressed: () {

                  // Add your button's action here
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => signin()),
                  );
                },
                child: Text("Log Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Monument Extended',
                      fontSize: 16,
                      color: Colors.white,
                    )
                ),
                width: 160,
              ),
            ),
            SizedBox(
              height: height*.019,
            ),
            Container(
              height: 60, // Set t
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container( // Replace with your image path
                      width: 38,
                      height: 52,
                      // margin: EdgeInsets.only(top: height*0.054),
                      child: InkWell(
                        onTap: () {
                          print('Rides');
                          // Add your button's action here
                        },
                        child: Image.asset(
                          'assets/icons/rides.png', // Replace with your image path
                          width: 38,
                          height: 52,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container( // Replace with your image path
                      width: 42,
                      height: 53,
                      // margin: EdgeInsets.only(top: height*0.054),
                      child: InkWell(
                        onTap: () {

                          // Add your button's action here

                          print('Home');
                        },
                        child: Image.asset(
                          'assets/icons/home.png', // Replace with your image path
                          width: 42,
                          height: 53,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container( // Replace with your image path
                      width: 65,
                      height: 55,
                      // margin: EdgeInsets.only(top: height*0.054),
                      child: InkWell(
                        onTap: () {

                          // Add your button's action here

                          print('Booking');
                        },
                        child: Image.asset(
                          'assets/icons/booking.png', // Replace with your image path
                          width: 65,
                          height: 55,
                          fit: BoxFit.fitHeight,
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

