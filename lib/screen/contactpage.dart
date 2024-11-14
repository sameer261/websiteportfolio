import 'package:flutter/material.dart';
import 'package:portfolio_website/screen/widgets/webbar.dart';
import 'package:portfolio_website/utility/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactpage extends StatelessWidget {
  // Function to open URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Set responsive font size and padding

    final double paddingValue = isMobile ? 10 : 20;

    // Define color variable for text
    Color textColor = Colors.white; // You can modify this color as needed

    return Scaffold(
      backgroundColor: darktheme,
      body: SingleChildScrollView(
        // Allow scrolling for small screens
        child: Column(
          children: [
            WebBar(), // Replaced the current header with WebBar

            // Contact section content
            Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left side: Contact text and details
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Contact me header text
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  isMobile ? 25 : 40, // Responsive font size
                              color:
                                  fontcolor, // Text color from the variable
                            ),
                            children: const [
                              TextSpan(
                                  text: 'Contact ',
                                  style: TextStyle(color: Colors.white)
                                  // Different color for "Contact"
                                  ),
                              TextSpan(
                                text: 'me',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                    
                        // Contact Details Section (Social Media and Communication)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildSocialMediaTextButton(
                              label: "Facebook",
                              onPressed: () {
                                _launchURL(
                                    'https://www.facebook.com/share/dxBpCGLgAh67dyTB/');
                              },
                              textColor: textColor,
                            ),
                            _buildSocialMediaTextButton(
                              label: "LinkedIn",
                              onPressed: () {
                                _launchURL(
                                    'https://www.linkedin.com/in/sameer-hussain-50b632327?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app');
                              },
                              textColor: textColor,
                            ),
                            _buildSocialMediaTextButton(
                              label: "Instagram",
                              onPressed: () {
                                _launchURL(
                                    'https://www.instagram.com/sameer_hussain_257?igsh=MXMzbHVtNWZuMHJyYw==');
                              },
                              textColor: textColor,
                            ),
                            const SizedBox(height: 8),
                    
                            // Phone number
                            const Text(
                              'Phone no',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '+923090429434',
                              style: TextStyle(color: Colors.white),
                            ),
                             const SizedBox(height: 10),
                            
                            const Text(
                              'Email',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'sameersamir74@gmail.com',
                              style: TextStyle(color: Colors.white,fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Right side: Image (Similar to "About me" page)
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(paddingValue),
                      child: Center(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/sameer1.png', // Your image
                            width: double.infinity,
                            height:
                                500, // Set a fixed height to prevent overflow
                            fit: BoxFit
                                .cover, // BoxFit for responsive image scaling
                          ),
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

  // Helper function to build social media text buttons without icons
  Widget _buildSocialMediaTextButton({
    required String label,
    required VoidCallback onPressed,
    required Color textColor,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(textColor),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 15, // Font size for the text
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  // Helper function to build text buttons for the navigation
  TextButton _buildTextButton(
      String label, VoidCallback onPressed, double fontSize, Color textColor) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.w400, fontSize: fontSize),
      ),
    );
  }
}
