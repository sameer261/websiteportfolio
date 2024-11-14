import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  // Function to handle URL launch
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), // Add padding of 10 pixels
      child: Container(
        height: 200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextButton('Home', 'assets/images/home.png', () {
                    Navigator.pushNamed(context, '/');
                  }, 14.0, 16, 16),
                  _buildTextButton('About Me', 'assets/images/user.png', () {
                    Navigator.pushNamed(context, '/about');
                  }, 14.0, 16, 16),
                  _buildTextButton('Contact', 'assets/images/phone.png', () {
                    Navigator.pushNamed(context, '/contact');
                  }, 14.0, 16, 16),
                ],
              ),
            ),
            const SizedBox(height: 20), // Space between row and bottom
            // Row for social media icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialMediaIcon('assets/images/fb.png', 'https://www.facebook.com/share/dxBpCGLgAh67dyTB/', 24, 24),
                const SizedBox(width: 10), // Space between icons
                _buildSocialMediaIcon('assets/images/insta.png', 'https://www.instagram.com/sameer_hussain_257?igsh=MXMzbHVtNWZuMHJyYw==', 24, 24),
                const SizedBox(width: 12), // Space between icons
                _buildSocialMediaIcon(
                  'assets/images/phone.png', 
                  'https://wa.me/qr/X27LTGYLYZASO1', 
                  13, 13, 
                  opacity: 0.5, // Set opacity of phone icon to 0.5
                ),
                const SizedBox(width: 10), 
                _buildSocialMediaIcon('assets/images/youtube.png', 'https://youtube.com/@ninjagaming-ug6tl?si=v8iUb5a2OekvVD70', 26, 26),
              ],
            ),
            const SizedBox(height: 25), // Space between social media row and terms button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/termsandconditions'); // Use named route here
                  },
                  child: Text(
                    'Terms of Service - Privacy Policy',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.50), // Set to 50% opacity
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build navigation buttons with icons
  TextButton _buildTextButton(
      String label,
      String imagePath,
      VoidCallback onPressed,
      double fontSize,
      double imageWidth,
      double imageHeight) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: imageWidth,
            height: imageHeight,
          ),
          const SizedBox(width: 5), // Space between image and text
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to handle social media icon tap and launch URL
  Widget _buildSocialMediaIcon(String imagePath, String url, double imageWidth, double imageHeight, {double opacity = 1.0}) {
    return GestureDetector(
      onTap: () => _launchURL(url), // Launch the URL when the icon is tapped
      child: Opacity(
        opacity: opacity, // Set opacity here (default is 1.0, but for phone icon, we can pass 0.5)
        child: Image.asset(
          imagePath,
          width: imageWidth,
          height: imageHeight,
        ),
      ),
    );
  }
}
