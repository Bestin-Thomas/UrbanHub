

import 'package:flutter/material.dart';
import 'package:urbanhub/Splash/page3.dart';

import '../Custom/Button.dart';


class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  var height,width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.sizeOf(context).height;
    width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xFF6189FF),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(000000),  Color(0xFF3D3373)], // Define your gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter, // Optional: Define stops to control color distribution
            ),
          ),
          height: height,
          width: width,
          child: Column(
              children: [
                Container(
                  height: height*.7286,
                  width: width,
                  // margin: EdgeInsets.only(left:height*0,right: width*0),
                  child: Image.asset('assets/images/page2.png',fit: BoxFit.fill,),),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: height*0.054),
                  child: Text(
                    'Join dynamic group ride sessions with expert\n coaches for an immersive indoor fitness journey',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'Inter',
                      height: 17 / 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(top: height*0.054),
                  child: FuturisticButton(onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => page3()),
                    );
                  },
                    child: Text("Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Monument Extended',
                          fontSize: 16,
                          color: Colors.white,
                        )
                    ),
                  ),
                )
              ]
          )
      ),
    );
  }
}

