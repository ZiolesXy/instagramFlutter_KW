import 'package:flutter/material.dart';
import '../widgets/story_list.dart';
import '../widgets/post_list.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class StoryPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Login & Register Buttons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text('Masuk'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text('Daftar'),
                  ),
                ],
              ),
            ),
            StoryList(),
            Expanded(child: PostList()),
          ],
        ),
      ),
    );
  }
}
