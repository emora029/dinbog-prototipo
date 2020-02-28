import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'package:dinbogprototipo/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
    //   statusBarColor: Colors.transparent
    // ));


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinbog - Prototipo',
      initialRoute: '/',
      routes: {
        '/'  : (BuildContext context ) => HomePage(),
      },
    );
  }

}