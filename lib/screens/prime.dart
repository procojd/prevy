import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:prevy/constant.dart';
import 'package:prevy/screens/allpapers.dart';
import 'package:prevy/screens/chat_screen.dart';
import 'package:prevy/screens/home.dart';
import 'package:prevy/screens/support.dart';

class prime extends StatefulWidget {
  @override
  State<prime> createState() => _primeState();
}

class _primeState extends State<prime> {
  StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();

    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() {
              isAlertSet = true;
            });
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  final Tabs = [yearList(), ChatScreen(), support()];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[_index],
      backgroundColor: kcp3,
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: kcp6,
        borderRadius: 25,
        iconSize: 20,
        itemBorderRadius: 18,
        selectedBackgroundColor: kcp3,
        selectedItemColor: kcp2,
        unselectedItemColor: kcp1,
        onTap: (int val) {
          setState(() {
            _index = val;
          });
        },
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: CupertinoIcons.home, title: 'Home'),
          FloatingNavbarItem(
              icon: CupertinoIcons.chat_bubble_2_fill, title: 'AI chat'),
          FloatingNavbarItem(
              icon: CupertinoIcons.cloud_upload, title: 'Support'),
        ],
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text(
            'No Connection',
            style: TextStyle(
                fontFamily: kf1,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: kCourseElementIconColor),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('oops! can\'t find internet'),
              SizedBox(
                width: 5,
              ),
              Flash(
                child: Icon(
                  CupertinoIcons.wifi,
                  size: 16,
                ),
              )
            ],
          ),
          // content: const Text('oops! can\'t find internet'),
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => isAlertSet = false);
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected && isAlertSet == false) {
                    showDialogBox();
                    setState(() => isAlertSet = true);
                  }
                },
                child: Icon(CupertinoIcons.restart)),
          ],
        ),
      );

  // showDialogBox() => showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: const Text('No Connection'),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               isDeviceConnected =
  //                   await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && isAlertSet == false) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
}
