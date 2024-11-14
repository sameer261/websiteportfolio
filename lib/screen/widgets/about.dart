import 'package:flutter/material.dart';
import 'package:portfolio_website/utility/colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

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
      padding: const EdgeInsets.all(20), // Mobile padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/music.png', // Mobile image size
            height: 20, // Adjust image size for mobile
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30, // Responsive font size
                    color: fontcolor,
                  ),
                  children: const [
                    TextSpan(
                      text: 'About ',
                      style:
                          TextStyle(color: Colors.white), // Color for "About"
                    ),
                    TextSpan(
                      text: 'me',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/images/bulb.png', // Adjust bulb image for mobile
                height: 60,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'I am a Flutter developer with a passion for creating beautiful and functional apps. My journey in coding started years ago, and since then, I have been continuously learning and evolving...',
            style: TextStyle(
              fontSize: 14, // Smaller text for mobile
              color: Colors.white.withOpacity(0.8),
            ),
            maxLines: 6, // Limit the number of lines
            overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
          ),
          const SizedBox(height: 30),
          Center(
            child: Image.asset(
              'assets/images/arrow2.png', // Adjust arrow for mobile
              height: 60,
            ),
          ),
           Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/pics2.png',
              height: 270, // Smaller image for mobile
            ),
          ),
        ],
      ),
    );
  }

  // Desktop or Tablet View Method
  Widget _buildDesktopView() {
    return Container(
      padding: const EdgeInsets.all(30), // Desktop padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Section: Text and Images
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/music.png', // Larger image for desktop
                    height: 40,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 42, // Larger font size for desktop
                            color: fontcolor,
                          ),
                          children: const [
                            TextSpan(
                              text: 'About ',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'me',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/bulb.png', // Larger bulb for desktop
                        height: 80,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'I am a Flutter developer with a passion for creating beautiful and functional apps. My journey in coding started years ago, and since then, I have been continuously learning and evolving...',
                    style: TextStyle(
                      fontSize: 18, // Larger text for desktop
                      color: Colors.white.withOpacity(0.8),
                    ),
                    maxLines: 6, // Limit lines if needed
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: Image.asset(
                      'assets/images/arrow2.png', // Arrow for desktop
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right Section: Image
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/pics2.png', // Larger image for desktop
              height: 500, // Larger image size for desktop
            ),
          ),
        ],
      ),
    );
  }
}