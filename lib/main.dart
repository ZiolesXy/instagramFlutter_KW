import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'screens/login_page.dart';
import 'screens/story_post_page.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (kIsWeb) {
    SharedPreferences.setPrefix('instagram_kw_');
    // Konfigurasi Intl untuk web
    Intl.defaultLocale = 'id_ID';
    // Gunakan Segmenter untuk web
    if (Intl.getCurrentLocale() == null) {
      Intl.defaultLocale = 'id_ID';
    }
  }
  
  // Konfigurasi untuk web
  if (kIsWeb) {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  
  // Tambahkan error handler untuk asset
  FlutterError.onError = (FlutterErrorDetails details) {
    // Hanya cek PlatformException jika bukan web
    if (!kIsWeb && details.exception is PlatformException) {
      print('PlatformException during app initialization: ${details.exception}');
    }
    FlutterError.presentError(details);
  };
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram KW',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
      home: FutureBuilder<bool>(
        future: AuthService().isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          
          if (snapshot.data == true) {
            return StoryPostPage();
          }
          
          return LoginPage();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
