import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/my_web_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: "Flutter",
        home: MyWebPage(),
      ),
    ),
  );
}

