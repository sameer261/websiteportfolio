import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the URL launcher
import 'package:portfolio_website/utility/colors.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile View
          return _buildMobileView();
        } else {
          // Desktop or Tablet View
          return _buildDesktopView();
        }
      },
    );
  }

  // Mobile View Method
  Widget _buildMobileView() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10), // Padding for mobile
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
                 
          // Left side: Text and Buttons
          Row(
            children: [
              Image.asset('assets/images/arrow1.png',height: 90,),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  // Row for Arrow Image + "FLUTTER" text
                  const Text(
                    'FLUTTER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30, // Font size for mobile
                      color: Colors.white,
                    ),
                  ),
                  // "DEVELOPER" Text
                  Text(
                    'DEVELOPER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30, // Font size for mobile
                      color: fontcolor,
                    ),
                  ),
                  const SizedBox(height: 20), // Space between text and buttons
              
                  // Buttons for Hire Me and Download CV
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Action for "Hire Me" Button
                        },
                        style: ElevatedButton.styleFrom(
                          
                          overlayColor: fontcolor.withOpacity(0.05),
                          backgroundColor: fontcolor,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        ),
                        child: const Text(
                          'Hire Me',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          _downloadCV();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF393E46).withOpacity(0.75),
                          overlayColor: fontcolor.withOpacity(0.05),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Download CV',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.download,
                              color: Colors.white,
                              size: 17,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40), // Space between buttons and image
                ],
              ),
            ],
          ),
          
          // pics11 Image on the right side
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/pics11.png',
              height: 270, // Smaller image for mobile
            ),
          ),
          
          // Box Image below pics11 Image, Centered
          const SizedBox(height: 20), // Space between pics11 image and box image
      
       
        Center(
          child: Image.asset(
            'assets/images/box.png',
            height: 30, // Smaller image for mobile
          ),
        ),
        ],
      ),
    );
  }

  // Desktop or Tablet View Method
  Widget _buildDesktopView() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20), // Responsive padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Image
          Expanded(
            flex: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/arrow1.png',
                  height:  120, // Responsive image height
                ),
                const SizedBox(height: 35), // Space below the image
              ],
            ),
          ),
          const SizedBox(width: 10), // Space between image and text

          // Text and buttons in the center
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'FLUTTER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42, // Responsive font size
                    color: Colors.white,
                  ),
                ),
                Text(
                  'DEVELOPER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:  42, // Responsive font size
                    color: fontcolor,
                  ),
                ),
                const SizedBox(height: 20), // Responsive space between text and buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for "Hire Me" Button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: fontcolor,
                        overlayColor: fontcolor.withOpacity(0.05),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12
                        ),
                      ),
                      child: const Text(
                        'Hire Me',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        _downloadCV();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF393E46).withOpacity(0.75),
                        overlayColor: fontcolor.withOpacity(0.05),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Download CV',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.download,
                            color: Colors.white,
                            size: 17,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/box.png',
                        height:  40, // Adjust height for responsiveness
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Right Image
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/pics11.png',
              height:  500, // Adjust height for responsiveness
            ),
          ),
        ],
      ),
    );
  }

  // Method to download the CV when the button is pressed
  Future<void> _downloadCV() async {
    const cvUrl = 'https://drive.google.com/file/d/1a0WR-uA3el-foXLgL6TZIf3V6PrkIJkI/view?usp=drive_link'; // URL of the CV file

    if (await canLaunch(cvUrl)) {
      await launch(cvUrl);
    } else {
      throw 'Could not launch $cvUrl'; // If URL can't be opened, show an error
    }
  }
}