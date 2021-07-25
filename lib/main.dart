import 'package:flutter/material.dart';
import 'package:lyheang_api_share_url/view/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random User',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        accentColor: Colors.red,
      ),
      home: ComplexApi(),
    ),
  );
}
