import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../data/story_data.dart';

class StoryList extends StatefulWidget {
  @override
  _StoryListState createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  final _authService = AuthService();
  String? _username;
  late List<StoryData> _stories;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadUser();
    _stories = StoryListData.getStories();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadUser() async {
    final user = await _authService.getCurrentUser();
    if (user != null) {
      setState(() {
        _username = user.username;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Scrollbar(
        controller: _scrollController,
        thickness: 6,
        radius: Radius.circular(10),
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              // Story pengguna
              Container(
                width: 70,
                margin: EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/default.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print('Error loading default image: $error');
                                return Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.grey[600],
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Yours',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Story lainnya
              ..._stories.map((story) => Container(
                width: 70,
                margin: EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.pink,
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          story.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print('Error loading story image: ${story.imageUrl} - $error');
                            return Image.asset(
                              'assets/images/default.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print('Error loading default image: $error');
                                return Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.grey[600],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      story.username,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
