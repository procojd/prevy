import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class subbranch extends StatelessWidget {
  String image;
  String branch;
  subbranch(this.image, this.branch);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: konBoardingtertiary,
      body: SlidingUpPanel(
        backdropEnabled: true,
        color: Colors.black54,
        minHeight: (size.height / 1.8),
        maxHeight: (size.height / 1.0),
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
                  tag: image,
                  child: Image(
                      width: double.infinity,
                      height: (size.height / 2) + 50,
                      image: AssetImage(image),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
        panel: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 223, 223, 223),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}
