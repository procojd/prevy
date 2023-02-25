import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prevy/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLSeJcB-AxGo48aU5PnZr-ukELdRKr4r6qSha88LBGQ54Szb40Q/viewform?usp=sf_link');

class support extends StatefulWidget {
  const support({Key key}) : super(key: key);

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Upload\n'
                'papers',
                style: kCardTitleStyle1,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SlideInUp(
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kcp7,
                      border: Border.all(color: kcp6,width: 0.2),
                      // color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    // height: MediaQuery.of(context).size.height * 0.62,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        FadeIn(
                          delay: Duration(seconds: 1),
                          child: SlideInUp(
                            delay: Duration(seconds: 1),
                            child: Text(
                              ' Become a\nContributor',
                              style: kCardTitleStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElasticIn(
                            child: Image(
                          image: AssetImage('assets/cloud.png'),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: FadeIn(
                            delay: Duration(milliseconds: 1300),
                            child: Text(
                              'Your single contribution can make a huge difference, take a step to support our college. you will be surely mentioned if you upload a unique paper.',
                              textAlign: TextAlign.center,
                              style: kSubtitleStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.bottomCenter,
                            // width: 100,
                            child: TextButton.icon(
                                onPressed: _launchUrl,
                                icon: FadeIn(
                                  delay: Duration(seconds: 1),
                                  duration: Duration(milliseconds: 200),
                                  child: Icon(
                                    CupertinoIcons.arrow_right_circle_fill,
                                    color: kcp1,
                                  ),
                                ),
                                label: Text(
                                  'Go',
                                  style: TextStyle(
                                      color: kcp1,
                                      fontFamily: kf1,
                                      fontSize: 24),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    kcp2,
                                  ),
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                          kcp3.withOpacity(0.3)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                                ))),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

// _launchURL() async {
//   const url = 'https://flutter.io';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
Future<void> _launchUrl() async {
  if (!await launchUrl(
    _url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $_url';
  }
}
