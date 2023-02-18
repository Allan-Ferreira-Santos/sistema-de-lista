import 'package:flutter/material.dart';
import 'package:sistema_de_lista/screens/homeScreen.dart';
import 'package:sistema_de_lista/screens/registerAnnotation.dart';
import 'package:sistema_de_lista/screens/splashScreen.dart';
import 'package:sistema_de_lista/screens/viewAnnotation.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const Splash(),
  '/HomeScreen': (BuildContext context) => const HomeScreen(),
  '/RegisterContacts': (BuildContext context) => const RegisterAnnotation(),
  '/ViewAnnotation': (BuildContext context) => const ViewAnnotation(),
};
