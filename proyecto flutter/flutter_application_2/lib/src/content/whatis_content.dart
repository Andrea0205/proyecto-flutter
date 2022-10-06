import 'package:flutter_application_2/src/widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WhatisContent extends ResponsiveWidget{
  const WhatisContent({Key? key}) : super(key: key);

  @override 
  Widget buildDesktop(BuildContext context){
    return DesktopWhatisContent();
  }

  @override 
  Widget buildMobile(BuildContext context){
    return MobileWhatisContent();
  }
}

class DesktopWhatisContent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * .65,
      child: Row(
        children: [
          Container(
            width: width * .3,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/app_screen.png')),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What is Flutter?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                SizedBox(height: 24),
                Text(
                  'Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase. Flutter transforms the app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 24),
              ],
            ),),
          ],
      ),
    );
  }
}

class MobileWhatisContent extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "What is Flutter?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(height: 24),
            Text(
                'Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase. Flutter transforms the app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase',
                style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 24),
                SizedBox(height: 48),
                Image.asset('assets/images/app_screen.png',
                height: 350,
                ),
        ],
      ),
      );
  }
}