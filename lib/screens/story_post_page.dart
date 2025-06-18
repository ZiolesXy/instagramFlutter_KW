import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/story_list.dart';
import '../widgets/post_list.dart';
import 'login_page.dart';

class StoryPostPage extends StatefulWidget {
  @override
  _StoryPostPageState createState() => _StoryPostPageState();
}

class _StoryPostPageState extends State<StoryPostPage> {
  final _authService = AuthService();
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await _authService.getCurrentUser();
    if (user != null) {
      setState(() {
        _username = user.username;
      });
    }
  }

  Future<void> _logout() async {
    await _authService.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram KW'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        children: [
          // Story List
          Container(
            height: 100,
            child: StoryList(),
          ),
          // Divider
          Divider(height: 1),
          // Post List
          Expanded(
            child: PostList(),
          ),
        ],
      ),
    );
  }
}
