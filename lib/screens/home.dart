import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prevy/screens/allpapers.dart';
import 'package:prevy/screens/subbranch.dart';
import 'package:prevy/screens/test.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/models.dart';

class yearList extends StatefulWidget {
  @override
  _yearListState createState() => _yearListState();
}

class _yearListState extends State<yearList> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController textController = TextEditingController();
  // List<Container> indicators = [];
  int currentPage = 0;

  int percentage;

  Future<void> getlength() async {
    int count = await FirebaseFirestore.instance
        .collection('papers')
        .get()
        .then((value) => value.size);
    if (mounted)
      setState(() {
        percentage = count;
      });
    ;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getlength();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcp1,
      body: SlidingUpPanel(
        panelSnapping: false,
        parallaxEnabled: true,
        backdropEnabled: true,
        backdropOpacity: 1,
        // backdropEnabled: true,

        color: kcp3,
        minHeight: (size.height / 1.6),
        maxHeight: (size.height / 1.09),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 300,
              ),
            ),
            Positioned(
              top: 40,
              left: 15,
              child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return;
                })),
                child: Icon(
                  CupertinoIcons.bars,
                  color: kcp3,
                  size: 30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 43,
                  ),
                  Text(
                    'Prevy',
                    style: TextStyle(
                        color: kcp3,
                        fontFamily: kf1,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Positioned(
                left: 20,
                top: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello!',
                      style: TextStyle(
                          fontSize: 30,
                          color: kcp3,
                          fontFamily: kf1,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                          fontSize: 20,
                          color: kcp3,
                          fontFamily: kf1,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      // width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: kcp5, borderRadius: BorderRadius.circular(18)),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total papers',
                            style: TextStyle(
                                fontSize: 20,
                                color: kcp3,
                                fontFamily: kf1,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '$percentage',
                                style: TextStyle(
                                    color: kcp1,
                                    fontFamily: kf1,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: kcp6,
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ))
          ],
        ),
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                    color: kcp2.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: AnimSearchBar(
                animationDurationInMilli: 500,
                helpText: '21-mc-midsem-432',
                color: kcp1,
                width: MediaQuery.of(context).size.width * 1,
                textController: textController,
                onSubmitted: (p0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    // print(p0);
                    return explore(p0, 'your search', 'name');
                  }));
                },
                onSuffixTap: null,
              ),
            ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       height: 1,
            //       width: MediaQuery.of(context).size.width * 0.9,
            //       decoration: BoxDecoration(
            //           color: kcp4.withOpacity(0.5),
            //           borderRadius: BorderRadius.circular(12)),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.6,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.all(18.0),
                      //   child: Text(
                      //     'Have a nice day.',
                      //     style: TextStyle(
                      //         color: kcp5,
                      //         fontFamily: kf2,
                      //         fontSize: 34,
                      //         fontWeight: FontWeight.w700),
                      //   ),
                      // ),
                      // Container(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Row(
                      //           children: <Widget>[
                      //             SizedBox(
                      //               width: 10,
                      //             ),
                      //             Text(
                      //               "Hello!",
                      //               style: TextStyle(
                      //                   color: kcp4,
                      //                   fontSize: 34,
                      //                   fontFamily: 'SF Pro Rounded',
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ],
                      //         ),
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: kcp2,
                      //           ),
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Icon(
                      //               CupertinoIcons.bars,
                      //               color: Colors.orangeAccent,
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, top: 10, bottom: 10),
                        child: Text(
                          'Semester',
                          style: TextStyle(
                            fontFamily: kf1,
                            fontSize: 20,
                            color: kcp1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10),
                        //   color: Color.fromARGB(255, 54, 57, 61),
                        // ),
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            semcard(
                              img: 's1.png',
                              color: kcp2,
                              heading: 'Midsem',
                              description:
                                  'Exam given near the middle of an academic grading term',
                              color1: kcp1,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            semcard(
                              img: 's2.png',
                              color: kcp2,
                              heading: 'Endsem',
                              description:
                                  'End semester is the last examination of the academic semester.',
                              color1: kcp1,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 10),
                        child: Container(
                          // color: Colors.blueAccent,
                          child: Text(
                            'Years',
                            style: TextStyle(
                                fontFamily: kf1,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: kcp1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(10),
                            //   color: Color.fromARGB(255, 54, 57, 61),
                            // ),
                            height: 100,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CarouselCard(
                                  car: cars[index],
                                );
                              },
                              itemCount: cars.length,
                              // controller: PageController(
                              //   initialPage: 0,
                              //   viewportFraction: 0.50,

                              // ),

                              // onPageChanged: (index) {
                              //   setState(() {
                              //     currentPage = index;
                              //   });
                              // },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // updateIndicators(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, top: 10, bottom: 10),
                        child: Container(
                          // color: Colors.blueAccent,
                          child: Text(
                            'Recent upload',
                            style: TextStyle(
                              fontFamily: kf1,
                              fontSize: 20,
                              color: kcp1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('upladong soon'),
                            ),
                            // height: 300,
                            width: MediaQuery.of(context).size.width * 0.94,
                            decoration: BoxDecoration(
                                color: kcp4.withOpacity(0.5),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class semcard extends StatelessWidget {
  final String img;
  final Color color;
  final String heading;
  final String description;
  final Color color1;
  const semcard(
      {@required this.img,
      @required this.color,
      @required this.heading,
      @required this.description,
      @required this.color1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[kcp5, kcp6],
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(119, 49, 56, 24),
                  offset: Offset(0, 1),
                  blurRadius: 1.0),
            ],
          ),
          width: 230,

          // height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 130,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        // color: kcp1,
                        image: DecorationImage(
                            image: new AssetImage('assets/$img'),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  heading,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: kf2,
                      fontSize: 20,
                      color: color1,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  description,
                  style:
                      TextStyle(fontFamily: kf1, fontSize: 12, color: color1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                    // width: 110,
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return explore(
                                heading.toLowerCase(), heading, 'name');
                          }));
                        },
                        icon: ZoomIn(
                          duration: Duration(milliseconds: 200),
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            color: color,
                          ),
                        ),
                        label: Text(
                          'checkout',
                          style: TextStyle(color: color),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(color1),
                          overlayColor: MaterialStateProperty.all<Color>(
                              color.withOpacity(0.3)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                        ))),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}

//card
// ignore: must_be_immutable
class CarouselCard extends StatelessWidget {
  CarouselCard({@required this.car});

  previous car;

  @override
  Widget build(BuildContext context) {
    String l1 = car.papers;

    return Padding(
      padding: EdgeInsets.only(top: 9.0, left: 5.0, right: 5.0, bottom: 9.0),
      child: Container(
        // width: 120,
        decoration:
            BoxDecoration(color: kcp8, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kcp5, borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      car.year.substring(2),
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: kf2,
                          fontWeight: FontWeight.w600,
                          color: kcp3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'papers \n' 'available',
                    style: TextStyle(
                        color: kcp1,
                        fontSize: 14,
                        fontFamily: kf1,
                        fontWeight: FontWeight.w100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$l1',
                        style: TextStyle(
                            color: kcp3,
                            fontSize: 16,
                            fontFamily: kf1,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(
                          CupertinoIcons.arrow_right_circle_fill,
                          color: kcp5,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            String temp = car.year.substring(2);
                            return explore(
                                car.year.substring(2), 'Year 2K$temp', 'name');
                          }));
                        },
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//car.year.substring(2),

class calenderdots extends StatelessWidget {
  const calenderdots({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        // minRadius: 10,
        maxRadius: 5,
      ),
    );
  }
}


// 