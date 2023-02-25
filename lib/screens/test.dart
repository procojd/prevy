import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class test extends StatelessWidget {
  test(this.name);
  final String name;
  String testi = '';
  @override
  Widget build(BuildContext context) {
    print(name);
    return Scaffold(
      appBar: AppBar(
        title: Text(name != null ? name : 'Your result'),
      ),
    );
  }
}

// Stack(
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       height: 180,
//                       width: MediaQuery.of(context).size.width * 1,
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [kcp5, kcp7]),
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(20),
//                               bottomRight: Radius.circular(200)),
//                           color: kcp5),
//                     ),
//                   ],
//                 ),
//                 Center(
//                     child: Column(
//                   children: [
//                     Text(
//                       'Total Papers',
//                       style: TextStyle(
//                           fontFamily: kf2,
//                           fontSize: 16,
//                           color: kcp3,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       '102',
//                       style: TextStyle(
//                           fontFamily: kf1,
//                           fontSize: 60,
//                           color: kcp3,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ],
//                 )),
//                 AnimSearchBar(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     textController: textController,
//                     onSubmitted: (allpapers) {})
//               ],
//             ),