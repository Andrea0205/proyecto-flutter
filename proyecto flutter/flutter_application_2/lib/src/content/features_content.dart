import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter_application_2/src/widget/responsive_widget.dart';
import 'package:flutter/material.dart';

const youtubeVideo = 'https://www.youtube.com/embed/A6RU-u8fHjE';


class FeatureContent extends ResponsiveWidget{
  FeatureContent({Key? key}) : super(key: key){
    ui.platformViewRegistry.registerViewFactory(
      'youtube-video',
        (int viewId) => IFrameElement()
        ..src = youtubeVideo
        ..style.border = 'none',
    );
  }

  @override 
  Widget buildDesktop(BuildContext context) => FeaturesContentResponsive(200);

  @override 
  Widget buildMobile(BuildContext context) => FeaturesContentResponsive(24);
}

class FeaturesContentResponsive extends StatelessWidget{
  final horizontalPadding;

  const FeaturesContentResponsive(this.horizontalPadding);

  @override 
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          children: [
            Text(
              "Features Section",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text('Share your Dart code between mobile and web applications; web is just another device target for your app. Also, showcase your app across multiple devices to quickly iterate and test based on customer feedback.',       
              style: TextStyle(fontSize: 20),
              ),
              ),
              SizedBox(height: 24),
              Container(
                width: 800,
                height: 450,
                child: HtmlElementView(viewType: 'youtube-video', key: UniqueKey()),
              ),
          ],
          ),
        ),
    );
  }
}