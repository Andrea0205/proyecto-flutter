import 'package:flutter_application_2/src/widget/responsive_widget.dart';
import 'package:flutter/material.dart';


class BenefitsContent extends ResponsiveWidget {
  const BenefitsContent({Key? key}) : super(key: key);

  @override 
  Widget buildDesktop(BuildContext context) => BenefitsContentResponsive(200);

  @override 
  Widget buildMobile(BuildContext context) => BenefitsContentResponsive(24);
  }

class BenefitsContentResponsive extends StatelessWidget{
  final horizontalPadding;

  const BenefitsContentResponsive(this.horizontalPadding);

  @override 
  Widget build(BuildContext context){
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          children: [
            Text(
              "Benefits",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Here are some benefits that Flutter have',
                style: TextStyle(fontSize: 20),
              ),
              ),
            SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Image(image: "assets/images/fast.png"),
                  _Image(image: "assets/images/Productive.png"),
                  _Image(image: "assets/images/flexible.png"),
                ],
              ),
            ),
          ],
        ),
        ),
    );
  }
}

class _Image extends StatelessWidget {
  final String image;

  const _Image({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16),
        Image.asset(image),
        SizedBox(width: 16),
      ],
    );
  }
}

class ScreenShotsContent extends StatelessWidget {
  const ScreenShotsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 250,
    );
  }
}