import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hando/screen_listing/listing.dart';

import 'view_models/locator.dart';

void main() async {
  runApp(_SplashScreen());
  await setupLocator();

  runApp(MaterialApp(home: ScreenListing()));
}

class _SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: CircularProgressIndicator()),
    );
  }
}
