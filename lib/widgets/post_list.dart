import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final List<String> postImages = [
    'images/post/post1.jpeg',
    'images/post/post2.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        // ambil path asset
        String imagePath = postImages[index % postImages.length];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SizedBox(
            height: 500, // tinggi setiap card
            width: double.infinity,
            child: Stack(
              children: [
                // background image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // semi-transparent overlay (opsional)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                // teks di tengah
                Center(
                  child: Text(
                    'Postingan ke‑${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black87,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
