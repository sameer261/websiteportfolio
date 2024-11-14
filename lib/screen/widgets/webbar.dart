import 'package:flutter/material.dart';

class WebBar extends StatelessWidget {
  const WebBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check if the screen width is less than 600px to decide for mobile or desktop layout
        final isMobile = constraints.maxWidth < 600;

        // Set responsive font size and padding
        final double fontSize2 = isMobile ? 16 : 22; // Larger font size for desktop
        final double fontSize = isMobile ? 10 : 12;  // Larger font size for desktop
        final double paddingValue = isMobile ? 10 : 20; // Padding adjustment for mobile vs desktop

        return Container(
          height: 80,
          width: double.infinity,
          
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo or brand name
                Text(
                  'SHFLUTTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                // Navigation buttons for mobile and desktop
                if (isMobile)
                  // Mobile layout: Stack buttons vertically or compact layout
                  _buildMobileNavBar(context, fontSize)
                else
                  // Desktop layout: Buttons in a horizontal row with larger spacing
                  _buildDesktopNavBar(context, fontSize),
              ],
            ),
          ),
        );
      },
    );
  }

  // Mobile-specific Navbar layout
  Widget _buildMobileNavBar(BuildContext context, double fontSize) {
    return Row(
      children: [
        _buildTextButton(context, 'Home', () {
          Navigator.pushNamed(context, '/');
        }, fontSize),
        SizedBox(width: 2),
        _buildTextButton(context, 'About me', () {
          Navigator.pushNamed(context, '/about');
        }, fontSize),
        SizedBox(width: 2),
        _buildTextButton(context, 'Contact', () {
          Navigator.pushNamed(context, '/contact');
        }, fontSize),
      ],
    );
  }

  // Desktop-specific Navbar layout
  Widget _buildDesktopNavBar(BuildContext context, double fontSize) {
    return Row(
      children: [
        _buildTextButton(context, 'Home', () {
          Navigator.pushNamed(context, '/');
        }, fontSize),
        SizedBox(width: 20), // Larger spacing for desktop
        _buildTextButton(context, 'About me', () {
          Navigator.pushNamed(context, '/about');
        }, fontSize),
        SizedBox(width: 20), // Larger spacing for desktop
        _buildTextButton(context, 'Contact', () {
          Navigator.pushNamed(context, '/contact');
        }, fontSize),
      ],
    );
  }

  // Common method to create the navigation buttons
  TextButton _buildTextButton(
      BuildContext context, String label, VoidCallback onPressed, double fontSize) {
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
          fontSize: fontSize,
        ),
      ),
    );
  }
}
