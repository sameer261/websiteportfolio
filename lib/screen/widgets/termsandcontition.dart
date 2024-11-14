import 'package:flutter/material.dart';
import 'package:portfolio_website/screen/widgets/webbar.dart';
import 'package:portfolio_website/utility/colors.dart';
 // Assuming WebBar is in the 'widgets' folder

class Termsandcontition extends StatelessWidget {
  const Termsandcontition({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Set responsive font size and padding

    final double paddingValue = isMobile ? 10 : 15;

    return Scaffold(
      backgroundColor: darktheme,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WebBar(),  // Replace the header with the WebBar widget
        
            // Terms and Conditions Section
            Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start ,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terms of Service",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _buildSectionTitle("Acceptance of Terms"),
                  _buildSectionContent(
                      "By using this website, you acknowledge that you have read, understood, and agree to be bound by these Terms of Service. If you do not agree to these terms, please do not use this site."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Use of Content"),
                  _buildSectionContent(
                      "All content on this website, including images, text, and code, is the property of Sameer (the website owner) and is protected by copyright laws. You may not reproduce, distribute, or use any of this content without permission."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Personal Use Only"),
                  _buildSectionContent(
                      "This website is intended for personal use only. You may not use any of the content for commercial purposes without obtaining prior written consent."),
                  SizedBox(height: 10),
                  _buildSectionTitle("No Liability"),
                  _buildSectionContent(
                      "Sameer makes no representations or warranties about the accuracy, reliability, or completeness of the content on this website. You use this website at your own risk, and Sameer will not be held responsible for any damages resulting from its use."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Privacy of User Data"),
                  _buildSectionContent(
                      "Sameer does not collect personal data through this website, except for necessary information like contact form submissions. Any data you provide will be used only for the intended purposes and will not be shared with third parties unless required by law."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Modifications to Terms"),
                  _buildSectionContent(
                      "Sameer reserves the right to change these terms at any time. Any updates will be posted on this page, and it is your responsibility to review these terms periodically."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Governing Law"),
                  _buildSectionContent(
                      "These Terms of Service are governed by the laws of Pakistan, and any disputes related to these terms will be resolved in the courts of Karachi, Pakistan."),
                  SizedBox(height: 30),
                                    
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _buildSectionTitle("Information We Collect"),
                  _buildSectionContent(
                      "We may collect the following types of information:\n\n1. Personal information (name, email address, phone number) if you submit a contact form or sign up for updates.\n2. Non-personal information such as browser type, IP address, and site usage statistics for analytics purposes."),
                  SizedBox(height: 10),
                  _buildSectionTitle("How We Use Your Information"),
                  _buildSectionContent(
                      "The personal data we collect is used for the following purposes:\n\n1. To respond to inquiries submitted via the contact form.\n2. To improve user experience and website functionality.\n3. To communicate with you if you request further information."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Cookies"),
                  _buildSectionContent(
                      "This website may use cookies to enhance user experience. Cookies are small data files that help us remember your preferences and improve the site’s performance. You can choose to disable cookies in your browser settings."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Data Protection"),
                  _buildSectionContent(
                      "We use reasonable security measures to protect your personal data from unauthorized access or disclosure. However, no security system is 100% secure, and we cannot guarantee complete security."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Third-Party Sharing"),
                  _buildSectionContent(
                      "We do not share your personal data with third parties unless required by law or to comply with legal processes."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Your Rights"),
                  _buildSectionContent(
                      "You have the right to request access to your personal information, correct it, or delete it at any time. If you would like to exercise these rights, please contact us via the provided contact form."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Changes to the Privacy Policy"),
                  _buildSectionContent(
                      "We may update this Privacy Policy periodically. Any changes will be posted here, and the date of the last update will be noted."),
                  SizedBox(height: 10),
                  _buildSectionTitle("Contact Us"),
                  _buildSectionContent(
                      "If you have any questions about this Privacy Policy or wish to contact us regarding your personal data, please reach out via the contact form on the website."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }

  // Helper function to build section content
  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 16,
          fontWeight: FontWeight.normal),
    );
  }
}
