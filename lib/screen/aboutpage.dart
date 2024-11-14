import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screen/widgets/webbar.dart';
import 'package:portfolio_website/utility/colors.dart';
 // Import WebBar

class Aboutpage extends StatefulWidget {
  const Aboutpage({Key? key}) : super(key: key);

  @override
  _AboutpageState createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  final String aboutText =
      "I am Sameer hussain, a passionate Flutter developer with expertise in building modern, beautiful, and responsive apps.\n\n";
  final String aboutText2 =
      "I specialize in creating engaging user interfaces and improving user experiences using Flutter and Dart.\n \nSKILLS\n\nflutter\ndart";

  String displayedText = "";
  int textIndex = 0;
  bool isFirstTextFinished =
      false; // Flag to indicate when the first text finishes typing

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  // Typing animation function for the first line
  void _startTypingAnimation() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (textIndex < aboutText.length) {
        setState(() {
          displayedText += aboutText[textIndex];
          textIndex++;
        });
      } else {
        // Once the first text finishes, set the flag and start the second line after a gap
        setState(() {
          isFirstTextFinished = true;
        });
        timer.cancel(); // Stop the first animation
        _startSecondTypingAnimation(); // Start the second animation
      }
    });
  }

  // Typing animation function for the second line
  void _startSecondTypingAnimation() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (textIndex < aboutText.length + aboutText2.length) {
        setState(() {
          // Append the second line after the gap
          if (textIndex - aboutText.length < aboutText2.length) {
            displayedText += aboutText2[textIndex - aboutText.length];
          }
          textIndex++;
        });
      } else {
        timer.cancel(); // Stop the second animation once it's finished
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Set responsive font size and padding
    final double fontSize2 = isMobile ? 16 : 18;
  
    final double paddingValue = isMobile ? 10 : 20;

    return Scaffold(
      backgroundColor: darktheme,
      body: SingleChildScrollView( // Allow scrolling on small screens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WebBar(), // Replaced the current header with WebBar
        
            // About content section
            Padding(
              padding: EdgeInsets.symmetric(vertical: paddingValue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side: About me content
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(paddingValue),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 30 : 42,
                                color: fontcolor,
                              ),
                              children: const [
                                TextSpan(
                                  text: 'About ',
                                  style: TextStyle(
                                      color: Colors.white), 
                                ),
                                TextSpan(
                                  text: 'me',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Animated typing text
                          Text(
                            displayedText,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: fontSize2,
                            ),
                          ),
                          // If the first text is finished, add a gap before the second text starts typing
                          if (isFirstTextFinished)
                            const SizedBox(height: 20), 
                        ],
                      ),
                    ),
                  ),
                  // Right side: Image
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(paddingValue),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/sameer1.png', 
                          width: double.infinity,
                          height: 500, // Set a maximum height for images
                          fit: BoxFit.cover, // BoxFit for responsive image scaling
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton _buildTextButton(
      String label, VoidCallback onPressed, double fontSize) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: fontSize),
      ),
    );
  }
}
