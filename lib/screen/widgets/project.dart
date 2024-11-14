import 'package:flutter/material.dart';
import 'package:portfolio_website/utility/colors.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

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
      // Adjust height for mobile
      width: double.infinity,
      padding: const EdgeInsets.all(15), // Mobile padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Got a Project in',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          Text(
            'mind?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: fontcolor,
            ),
          ),
          const SizedBox(height: 10), // Space between text and images
          Row(
            children: [
              Image.asset(
                'assets/images/arrow3.png',
                height: 40, // Adjusted height for mobile
              ),
              const SizedBox(width: 5),
              Image.asset(
                'assets/images/pic45.png',
                height: 180, // Adjusted height for mobile
              ),
            ],
          ),
          const SizedBox(height: 15),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _buildLabelAndField('Your Name', 'Name', _nameController, true),
                const SizedBox(height: 10),
                _buildLabelAndField(
                    'Your Email', 'Email', _emailController, true),
                const SizedBox(height: 10),
                _buildMessageField(true),
                const SizedBox(height: 15),
                _buildSendMessageButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Desktop View Method
  Widget _buildDesktopView() {
    return Container(
      height: 600, // Adjust height for desktop
      width: double.infinity,
      padding: const EdgeInsets.all(20), // Desktop padding
      child: Row(
        children: [
          // Left Column for Project Text and Arrow
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Got a Project in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Text(
                'mind?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: fontcolor,
                ),
              ),
              const SizedBox(height: 10), // Space between text and images
              Row(
                children: [
                  Image.asset(
                    'assets/images/arrow3.png',
                    height: 50, // Adjusted height for desktop
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/images/pic45.png',
                    height: 220, // Adjusted height for desktop
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 20), // Space between left and right

          // Right Column for form
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabelAndField(
                          'Your Name', 'Name', _nameController, false),
                      const SizedBox(height: 10),
                      _buildLabelAndField(
                          'Your Email', 'Email', _emailController, false),
                      const SizedBox(height: 10),
                      _buildMessageField(false),
                      const SizedBox(height: 15),
                      _buildSendMessageButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelAndField(String label, String hintText,
      TextEditingController controller, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            cursorColor: fontcolor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              filled: true,
              fillColor: const Color(0xFF393E46).withOpacity(0.5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              if (label == 'Your Email' &&
                  !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMessageField(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Message',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          height: isMobile ? 150 : 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF393E46).withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: _messageController,
            cursorColor: fontcolor,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Your message',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
            textAlignVertical: TextAlignVertical.top,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Message is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSendMessageButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          setState(() {
            _nameController.clear();
            _emailController.clear();
            _messageController.clear();
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Message Sent!')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: fontcolor,
        overlayColor: fontcolor.withOpacity(0.05),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Send Message',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Image.asset(
            'assets/images/send.png',
            height: 30,
            width: 24,
          ),
        ],
      ),
    );
  }
}
