import 'package:flutter/material.dart';
import 'package:portfolio_website/screen/widgets/about.dart';
import 'package:portfolio_website/screen/widgets/footer.dart';
import 'package:portfolio_website/screen/widgets/mainhome.dart';
import 'package:portfolio_website/screen/widgets/project.dart';
import 'package:portfolio_website/screen/widgets/recentwork.dart';
import 'package:portfolio_website/screen/widgets/webbar.dart';
import 'package:portfolio_website/utility/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darktheme,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          WebBar(), // Using the new WebBar widget
          MainHome(), // Using the MainHome widget
          AboutSection(), // Using the AboutSection widget
          RecentWork(),// Using the RecentWork widget
          Project() ,// Using the PROJECT widget
          Footer(), // Using the Footer widget
        ],
      ),
    );
  }
}
