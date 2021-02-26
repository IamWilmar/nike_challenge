import 'package:flutter/material.dart';
import 'package:nike_challenge/pages/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home' : (_) => HomePage(),
};