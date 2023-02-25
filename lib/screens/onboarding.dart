import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prevy/constant.dart';
import 'package:prevy/main.dart';
import 'package:prevy/screens/home.dart';
import 'package:prevy/screens/prime.dart';
import 'package:shared_preferences/shared_preferences.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({Key key}) : super(key: key);

  _soi() async {
    int isviewed = 0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('initScreen', isviewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              left: 60,
              top: MediaQuery.of(context).size.height * 0.2,
              child: Pulse(
                  delay: Duration(seconds: 1),
                  infinite: true,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: kcp3,
                  )),
            ),
            Positioned(
              left: 150,
              top: MediaQuery.of(context).size.height * 0.4,
              child: Pulse(
                  infinite: true,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: kcp6,
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              child: Pulse(
                  delay: Duration(milliseconds: 600),
                  infinite: true,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: kcp2,
                  )),
            ),
            Positioned(
              left: 40,
              top: MediaQuery.of(context).size.height * 0.6,
              child: Pulse(
                  delay: Duration(milliseconds: 900),
                  infinite: true,
                  child: CircleAvatar(
                    radius: 150,
                    backgroundColor: kcp4,
                  )),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Container(),
            ),
            // Center(
            //   child: ElevatedButton(
            //     child: Text('Verify'),
            //     style: ButtonStyle(
            //       elevation: MaterialStateProperty.all(0),
            //       backgroundColor: MaterialStateProperty.all<Color>(
            //           Color.fromARGB(24, 196, 196, 196)),
            //     ),
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return prime();
            //       }));
            //     },
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'No \n' 'more \n' 'worries',
                    style: TextStyle(
                        color: kcp1,
                        fontFamily: kf1,
                        letterSpacing: 2,
                        height: 1,
                        fontSize: 75,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22.0, vertical: 0),
                  child: Text(
                    'Here you can find the previous\n'
                    'year question with just a click but first\n'
                    'you have to verify yourself\n',
                    style: TextStyle(color: kcp1, fontSize: 16),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(106, 0, 0, 0),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        onEditingComplete: () {},
                        cursorColor: Color.fromARGB(255, 235, 235, 235),
                        // initialValue: 'DTU email',
                        maxLength: 50,
                        // style: kSubtitleStyle,
                        decoration: InputDecoration(

                            // fillColor: Colors.white,
                            focusColor: Colors.white,
                            // icon: Icon(Icons.favorite),
                            hintText: 'DTU Email'

                            // labelText: 'DTU Email',
                            // labelStyle: kSubtitleStyle
                            // helperText: 'Helper text',
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await _soi();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return prime();
                      }));
                    },
                    icon: Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: kcp1,
                      size: 70,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
