import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prevy/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class explore extends StatelessWidget {
  String search;
  String name;
  String title;
  explore(this.name, this.title, this.search);
  @override
  Widget build(BuildContext context) {
    String query = name;

    // query = name;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kcp3,
        body: SlidingUpPanel(
          backdropEnabled: true,
          parallaxEnabled: true,
          backdropOpacity: 1,
          color: kcp4,
          minHeight: (size.height / 1.18),
          maxHeight: (size.height / 1.0),
          boxShadow: [BoxShadow(color: kcp3)],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                      tag: Container,
                      child: Container(
                        color: kcp6,
                        height: 300,
                        width: double.infinity,
                      )),
                ),
                Positioned(
                  top: 80,
                  left: 20,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: kf1,
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: kcp1),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      color: kcp1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          panel: Container(
            decoration: BoxDecoration(
              color: kcp3,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.amber,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 4,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: kcp2.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("papers")
                                  .snapshots()
                                  .asBroadcastStream(),

                              // stream: (query != "")
                              //     ? FirebaseFirestore.instance
                              //         .collection('Recipes')
                              //         .where('title', isGreaterThanOrEqualTo: 'sushi')
                              //         .snapshots()
                              //     : FirebaseFirestore.instance
                              //         .collection('Recipes')
                              //         .snapshots(),

                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                // snapshot.data!.docs.

                                // print(snapshot.data.size);
                                if (snapshot.data.docs
                                    .where((QueryDocumentSnapshot<Object>
                                            element) =>
                                        element[search]
                                            .toString()
                                            .toLowerCase()
                                            .contains(query.toLowerCase()))
                                    .isNotEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0,
                                      right: 0,
                                    ),
                                    child: SlideInUp(
                                      duration: Duration(milliseconds: 100),
                                      child: ListView(children: [
                                        ...snapshot.data.docs
                                            .where(
                                                (QueryDocumentSnapshot<Object>
                                                        element) =>
                                                    element[search]
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(query
                                                            .toLowerCase()))
                                            .map((QueryDocumentSnapshot<Object>
                                                    note) =>
                                                noteCard(note))
                                            .toList()
                                      ]),
                                    ),
                                  );

                                  // return GridView(
                                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 2),
                                  //     children: snapshot.data!.docs.map(
                                  //       (note) => noteCard((){},note)
                                  //     ).toList());
                                }

                                return nodatacard();
                              },
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class nodatacard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      duration: Duration(milliseconds: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: kcp7.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.search_circle_fill,
                  color: kcp8,
                  size: 30,
                ),
                Text(
                  'We will adding them soooon...',
                  style: TextStyle(
                      color: kcp5,
                      fontFamily: kf1,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget noteCard(QueryDocumentSnapshot doc) {
  String name = doc['name'].substring(3);
  String year = doc['name'].substring(0, 2);
  return Container(
    height: 65,
    // decoration: BoxDecoration(
    //     color: kcp6.withOpacity(0.2), borderRadius: BorderRadius.circular(14)),
    child: Column(
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/pdf.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                color: kcp5,
                height: 40,
                width: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Paper: $name',
                      style: TextStyle(
                          fontFamily: kf1,
                          color: kcp1,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Year: 20$year',
                      style: TextStyle(
                          fontFamily: kf1,
                          color: kcp1,
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 35,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      await downloadFile();
                    },
                    icon: Icon(
                      CupertinoIcons.link,
                      size: 20,
                      color: kcp1,
                    )),
                decoration: BoxDecoration(
                    color: kcp4, borderRadius: BorderRadius.circular(10)),
              ),
              // Icon(
              //   Icons.pdf,
              //   color: kcp5,
              //   size: 16,
              // )
            ]),
        Divider(
          height: 1,
          color: kcp7,
        )
      ],
    ),
  );
}

Future<void> downloadFile() async {
  final Reference ref = FirebaseStorage.instance.ref('files/Resume1.pdf');

  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  final File tempFile = File(appDocPath + '/' + 'Resume1.pdf');
  try {
    await ref.writeToFile(tempFile);
    await tempFile.create();
    await OpenFile.open(tempFile.path);
  } on FirebaseException {
    // BuildContext context;
    // ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Error, file download',
        style: kCardTitleStyle1,
      ),
    );
    // );
  }
  // BuildContext context;
  // ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
      content: Text(
        'File opened',
        style: kCardTitleStyle1,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)));
}
