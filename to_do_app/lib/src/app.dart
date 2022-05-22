import 'package:flutter/material.dart';

import '../screen/home_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: HomeScreen(),

    );
  }
}
