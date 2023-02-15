import 'package:flutter/material.dart';
import 'package:sistema_de_lista/screens/registerContact.dart';
import 'package:sistema_de_lista/screens/splashScreen.dart';
import 'package:sistema_de_lista/screens/viewAnnotation.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const Splash(),
  '/RegisterContacts': (BuildContext context) => const RegisterContacts(),
  '/ViewAnnotation': (BuildContext context) => const ViewAnnotation(),
};
