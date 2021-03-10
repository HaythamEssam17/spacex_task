import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Controllers/launchesController.dart';
import 'Controllers/rocketController.dart';
import 'Views/splashHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LaunchesController()),
        ChangeNotifierProvider(create: (_) => RocketController()),
      ],
      child: MaterialApp(
        title: 'SpaceX Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashHomePage(),
      ),
    );
  }
}
