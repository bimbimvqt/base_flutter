import 'package:flutter/material.dart';
import 'package:song_social/main.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.prod;
  debugPrint('prod');
  runApp(MyApp());
}
