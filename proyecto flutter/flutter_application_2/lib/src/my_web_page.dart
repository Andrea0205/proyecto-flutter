import 'package:flutter_application_2/src/content/casestudies_content.dart';
import 'package:flutter_application_2/src/content/features_content.dart';
import 'package:flutter_application_2/src/content/whatis_content.dart';
import 'package:flutter_application_2/src/content/benefits_content.dart';
import 'package:flutter_application_2/src/navigation_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final whatisKey = new GlobalKey();
final featureKey = new GlobalKey();
final benefitsKey = new GlobalKey();
final casestudiesKey = new GlobalKey();

final currentPageProvider = StateProvider<GlobalKey>((_) => whatisKey);
final scrolledProvider = StateProvider<bool>((_) => false);


class MyWebPage extends HookConsumerWidget {
  void onScroll(ScrollController controller, WidgetRef ref) {
    final isScrolled = ref.read(scrolledProvider);

    if (controller.position.pixels > 5 && !isScrolled) {
      ref.read(scrolledProvider.state).state = true;
    } else if (controller.position.pixels <= 5 && isScrolled) {
      ref.read(scrolledProvider.state).state = false;
    }
  }

void scrollTo(GlobalKey key) =>
  Scrollable.ensureVisible(key.currentContext!, duration: Duration(milliseconds: 500));


  @override
  Widget build(BuildContext context, WidgetRef ref){
    final _controller = useScrollController();

    useEffect(() {
      _controller.addListener(() => onScroll(_controller, ref));
      return _controller.dispose;
    }, [_controller]);

    double width = MediaQuery.of(context).size.width;
    double maxWidth = width > 1200 ? 1200 : width;

    ref.watch(currentPageProvider.state).addListener(scrollTo, fireImmediately: false);


    return Scaffold(
      body: Center(
        child: Container(
          width: maxWidth,
          child: Column(
            children: [
              NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: <Widget>[
                      WhatisContent(key: whatisKey),
                      FeatureContent(key: featureKey),
                      BenefitsContent(key: benefitsKey),
                      CasestudiesContent(key: casestudiesKey),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}