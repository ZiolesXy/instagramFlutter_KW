import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../data/post_data.dart';
import '../data/story_data.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _authService = AuthService();
  String? _username;
  late List<PostData> _posts;
  late List<StoryData> _stories;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadUser();
    _posts = PostListData.getPosts();
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

  String _getProfileImage(String username) {
    final story = _stories.firstWhere(
      (story) => story.username == username,
      orElse: () => _stories.first,
    );
    return story.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thickness: 6,
      radius: Radius.circular(10),
      thumbVisibility: true,
      child: ListView.builder(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          final profileImage = _getProfileImage(post.username);
          
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header post
                ListTile(
                  leading: ClipOval(
                    child: Image.asset(
                      profileImage,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading profile image: $profileImage - $error');
                        return Image.asset(
                          'assets/images/default.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print('Error loading default image: $error');
                            return Container(
                              width: 40,
                              height: 40,
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.person,
                                color: Colors.grey[600],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  title: Text(
                    post.username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(post.timeAgo),
                  trailing: IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ),
                // Gambar post
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Image.asset(
                    post.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading post image: ${post.imageUrl} - $error');
                      return Center(
                        child: Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
                // Action buttons
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.comment_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.share_outlined),
                        onPressed: () {},
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.bookmark_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                // Caption
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${post.likes} likes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: '${post.username} ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: post.caption),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Lihat semua ${post.comments} komentar',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
