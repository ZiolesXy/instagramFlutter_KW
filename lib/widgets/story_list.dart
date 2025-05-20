import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StoryList extends StatefulWidget {
  @override
  _StoryListState createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  final ScrollController _scrollController = ScrollController();

  // Daftar pasangan nama dan gambar (nama, nama_gambar)
  final List<Map<String, String>> storyData = [
    {'name': 'Yours', 'image': 'firefly.jpeg'},
    {'name': 'ZiolesXy', 'image': 'Acheron.jpeg'},
    {'name': 'fahri_v07', 'image': 'tungtung.jpeg'},
    {'name': 'Alphonse Elric', 'image': 'tungtung.jpeg'},
    {'name': 'mie ayam 😋', 'image': 'tungtung.jpeg'},
    {'name': 'Rafif Dzaky Akmal', 'image': 'tungtung.jpeg'},
    {'name': 'Vylan Drago', 'image': 'tungtung.jpeg'},
    {'name': 'Voksi Doksi', 'image': 'tungtung.jpeg'},
    {'name': 'LeBron Jamet', 'image': 'tungtung.jpeg'},
    {'name': 'SigmaGyatt', 'image': 'tungtung.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            _scrollController.jumpTo(
              _scrollController.offset + event.scrollDelta.dy,
            );
          }
        },
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          itemCount: storyData.length,
          separatorBuilder: (_, __) => SizedBox(width: 12),
          itemBuilder: (context, index) {
            // Mengambil data nama dan gambar dari storyData
            final story = storyData[index];
            final storyName = story['name']!;
            final storyImage = story['image']!;     

            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: AssetImage('images/people/$storyImage'),
                ),
                SizedBox(height: 6),
                SizedBox(
                  width: 60,
                  child: Text(
                    storyName,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
