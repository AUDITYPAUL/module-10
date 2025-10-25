import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Grid UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0E1722), // dark page bg like screenshot
        cardTheme: const CardTheme(
          elevation: 2,
          margin: EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
      home: const CoursesPage(),
    );
  }
}

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  final List<Map<String, String>> courses = const [
    {
      'image': 'assets/images/img1.jpg',
      'title': 'Full Stack Web Development with JavaScript (MERN)',
      'badge1': 'ব্যাচ ১১',
      'badge2': '৬ সিট বাকি',
      'badge3': '৬ দিন বাকি'
    },
    {
      'image': 'assets/images/img2.jpg',
      'title': 'Full Stack Web Development with Python, Django & React',
      'badge1': 'ব্যাচ ৬',
      'badge2': '৮৬ সিট বাকি',
      'badge3': '৪০ দিন বাকি'
    },
    {
      'image': 'assets/images/img3.jpg',
      'title': 'Full Stack Web Development with ASP.Net Core',
      'badge1': 'ব্যাচ ৭',
      'badge2': '৭৫ সিট বাকি',
      'badge3': '৩৯ দিন বাকি'
    },
    {
      'image': 'assets/images/img4.jpg',
      'title': 'SQA: Manual & Automated Testing',
      'badge1': 'ব্যাচ ১৩',
      'badge2': '৬৫ সিট বাকি',
      'badge3': '৪১ দিন বাকি'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Use SafeArea and center content with fixed width card area to mimic screenshot's centered column
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 820),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            child:  GridView.builder(
  itemCount: courses.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    mainAxisExtent: 370, // 🟢 fixed pixel height instead of aspect ratio
  ),
  itemBuilder: (context, index) {
    final item = courses[index];
    return CourseCard(
      imagePath: item['image']!,
      title: item['title']!,
      badge1: item['badge1']!,
      badge2: item['badge2']!,
      badge3: item['badge3']!,
    );
  },
)
,
          ),
        ),
      ),
    );
  }
}

 class CourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String badge1;
  final String badge2;
  final String badge3;

  const CourseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.badge1,
    required this.badge2,
    required this.badge3,
  });

  Widget _buildBadge(String text, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: Colors.black87),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: const TextStyle(fontSize: 11, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine icon for badges
    IconData? seatIcon = Icons.event_seat_outlined;
    IconData? clockIcon = Icons.access_time;

    return Card(
      color: const Color(0xFFF7F7F9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top banner image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 3 / 1.4,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Icon(Icons.image, size: 34, color: Colors.black26),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Badges row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildBadge(badge1),
                const SizedBox(width: 8),
                _buildBadge(badge2, icon: seatIcon),
                const SizedBox(width: 8),
                _buildBadge(badge3, icon: clockIcon),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const Spacer(),

          // Details button
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 14),
            child: SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE9E9ED),
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Text(
                        'বিস্তারিত দেখুন',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
