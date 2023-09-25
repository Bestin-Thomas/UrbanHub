

import 'package:flutter/material.dart';
import 'package:urbanhub/Custom/Button.dart';
import 'package:urbanhub/Splash/page2.dart';


class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
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
                margin: EdgeInsets.only(left: height*0.088),
                height: height*0.73,
                          // width: width,
                          child: Image.asset('assets/images/page1.png',fit: BoxFit.fitHeight,),
              ),
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
                    MaterialPageRoute(builder: (context) => page2()),
                  );
                },
                  child: Text("Let's Go",
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

