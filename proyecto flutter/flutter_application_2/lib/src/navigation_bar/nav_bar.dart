import 'package:flutter_application_2/src/my_web_page.dart';
import 'package:flutter_application_2/src/navigation_bar/nav_bar_button.dart';
import 'package:flutter_application_2/src/widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavBar extends ResponsiveWidget{
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) {
    return DesktopNavBar();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return MobileNavBar();
  }
}

class DesktopNavBar extends HookConsumerWidget{
  @override 
  Widget build(BuildContext context, WidgetRef ref){
    final isScrolled = ref.watch(scrolledProvider);
    final navBarColor = isScrolled ? Colors.white: Colors.white;

    return Container(
      color: navBarColor,
      child: Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            height: 60.0,
          ),
          SizedBox(width: 10.0),
          Text(
            "Flutter",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 32,
            ),
          ),
          Expanded(child: Container()),
           NavBarButton(
                onTap: () => ref.read(currentPageProvider.state).state = whatisKey,
                text: 'What is?'),
              NavBarButton(
                onTap: ()=> ref.read(currentPageProvider.state).state = featureKey, 
                text: 'Features'),
              NavBarButton(
                onTap: ()=> ref.read(currentPageProvider.state).state = benefitsKey,
                text: 'Benefits'),
              NavBarButton(
                onTap: ()=> ref.read(currentPageProvider.state).state = casestudiesKey, 
                text: 'Case Studies'),
        ],
      ),  
      ),
    );
  }
}


class MobileNavBar extends HookConsumerWidget{
    @override 
  Widget build(BuildContext context, WidgetRef ref){
final containerHeight = useState<double>(0.0);

    final isScrolled = ref.watch(scrolledProvider);
    final navBarColor = isScrolled ? Colors.white: Colors.white;

    return Stack(
      children: [
        AnimatedContainer(
        margin: EdgeInsets.only(top: 95.0),
        curve: Curves.ease,
        duration: Duration(milliseconds: 350),
        height: containerHeight.value,
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavBarButton(               
                text: 'What is?',
                onTap: () { ref.read(currentPageProvider.state).state = whatisKey;
                containerHeight.value = 0;
                },
                ),
              NavBarButton(
                text: 'Features',
                onTap: () { ref.read(currentPageProvider.state).state = featureKey;
                containerHeight.value = 0;
                },
                ),
              NavBarButton(
                text: 'Benefits',
                onTap: () { ref.read(currentPageProvider.state).state = benefitsKey;
                containerHeight.value = 0;
                },
                ),
              NavBarButton(
                text: 'Case Studies',
                onTap: () { ref.read(currentPageProvider.state).state = casestudiesKey;
                containerHeight.value = 0;
                },
                ),
            ],
          ),
        ),
        ),
      Container(
      color: navBarColor,
      child: Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            height: 60.0,
          ),
          SizedBox(width: 10.0),
          Text(
            "Flutter",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 32,
            ),
          ),
          Expanded(child: Container()),  
          Material(
            child: InkWell(
              splashColor: Colors.white60,
              onTap: () {
                final height = containerHeight.value > 0 ? 0.0 : 240.0;
                containerHeight.value = height;
              },
              child: Icon(
                Icons.menu,
                color: Colors.black54
              ),
            ),
          ),       
        ],
      ),  
      ),
      ),
    ],
  );
  }
}