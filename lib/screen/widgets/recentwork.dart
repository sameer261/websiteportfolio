import 'package:flutter/material.dart';
import 'package:portfolio_website/utility/colors.dart';

// Define a simple model for work items
class WorkItem {
  final String imagePath;
  final String type; // "Apps", "Websites", etc.

  WorkItem({required this.imagePath, required this.type});
}

class RecentWork extends StatefulWidget {
  const RecentWork({Key? key}) : super(key: key);

  @override
  _RecentWorkState createState() => _RecentWorkState();
}

class _RecentWorkState extends State<RecentWork> {
  String selectedFilter = 'All'; // Default filter

  // Sample list of work items
  final List<WorkItem> workItems = [
    WorkItem(imagePath: 'assets/images/work1.png', type: 'Apps'),
    WorkItem(imagePath: 'assets/images/work2.png', type: 'Websites'),
    WorkItem(imagePath: 'assets/images/work3.png', type: 'Apps'),
    // Add more items as needed
  ];

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
    final double containerHeight = 300.0; // Fixed container height for mobile
    final double buttonPadding = 6.0; // Padding for buttons on mobile
    final double workContainerWidth = 130.0; // Work container width for mobile
    final double workContainerHeight = 100.0; // Work container height for mobile

    // Filter the work items based on the selected filter
    List<WorkItem> filteredItems = selectedFilter == 'All'
        ? workItems
        : workItems.where((item) => item.type == selectedFilter).toList();

    return Container(
      height: containerHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/pics3.png',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // Space above the title
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24, // Font size for mobile
                      color: Colors.white, // Default color
                    ),
                    children: [
                      TextSpan(text: 'My recent '),
                      TextSpan(
                        text: 'works',
                        style: TextStyle(color: fontcolor), // Change this to fontcolor
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Space between title and buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildFilterButton('All', buttonPadding),
                    const SizedBox(width: 10),
                    _buildFilterButton('Apps', buttonPadding),
                    const SizedBox(width: 10),
                    _buildFilterButton('Websites', buttonPadding),
                  ],
                ),
                const SizedBox(height: 20), // Space below the buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: filteredItems.map((item) {
                      return _buildWorkContainer(item.imagePath,
                          workContainerWidth, workContainerHeight);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Desktop or Tablet View Method
  Widget _buildDesktopView() {
    final double containerHeight = 400.0; // Fixed container height for desktop
    final double buttonPadding = 15.0; // Padding for buttons on desktop
    final double workContainerWidth = 170.0; // Work container width for desktop
    final double workContainerHeight = 140.0; // Work container height for desktop

    // Filter the work items based on the selected filter
    List<WorkItem> filteredItems = selectedFilter == 'All'
        ? workItems
        : workItems.where((item) => item.type == selectedFilter).toList();

    return Container(
      height: containerHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/pics3.png',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // Space above the title
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32, // Font size for desktop
                      color: Colors.white, // Default color
                    ),
                    children: [
                      TextSpan(text: 'My recent '),
                      TextSpan(
                        text: 'works',
                        style: TextStyle(color: fontcolor), // Change this to fontcolor
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Space between title and buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildFilterButton('All', buttonPadding),
                    const SizedBox(width: 10),
                    _buildFilterButton('Apps', buttonPadding),
                    const SizedBox(width: 10),
                    _buildFilterButton('Websites', buttonPadding),
                  ],
                ),
                const SizedBox(height: 20), // Space below the buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: filteredItems.map((item) {
                    return _buildWorkContainer(item.imagePath,
                        workContainerWidth, workContainerHeight);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build filter buttons
  Widget _buildFilterButton(String label, double verticalPadding) {
    bool isSelected = selectedFilter == label;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedFilter = label; // Update the selected filter
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor:
            isSelected ? fontcolor : const Color(0xFF393E46).withOpacity(0.5),
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding),
      ),
      child: Text(label),
    );
  }

  // Method to build individual work containers
  Widget _buildWorkContainer(String imagePath, double width, double height) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF393E46).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          
        ),
      ),
    );
  }
}
