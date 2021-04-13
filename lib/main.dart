import 'package:flutter/material.dart';
import 'package:hando/presentation/account.dart';
import 'package:hando/presentation/buy.dart';
import 'package:hando/presentation/home.dart';
import 'package:hando/presentation/sell.dart';

import 'presentation/screen_listing/listing.dart';
import 'view_models/locator.dart';

void main() async {
  runApp(_SplashScreen());
  await setupLocator();

  runApp(
    MaterialApp(
      // home: Buy(),
      // home: Account(),
      home: Home(),
      // home: Sell(),
      // home: ScreenListing(),
    ),
  );
}

class _SplashScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Center(child: CircularProgressIndicator()),
    );
  }
}
