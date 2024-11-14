import 'package:flutter/material.dart';
import 'package:portfolio_website/screen/home_view.dart';
import 'package:portfolio_website/screen/aboutpage.dart';
import 'package:portfolio_website/screen/contactpage.dart';
import 'package:portfolio_website/screen/widgets/termsandcontition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sameer hussain',
      // Define the initial route (Home)
      initialRoute: '/',
      // Define the routes (URL mappings)
      routes: {
        '/': (context) => const HomeView(),  // Home page
        '/about': (context) => const Aboutpage(),  // About page
        '/contact': (context) =>  Contactpage(), // contact page 
        '/termsandconditions': (context) => const Termsandcontition(), // terms and condition page
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
