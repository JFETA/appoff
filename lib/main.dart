import 'package:flutter/material.dart';
import 'package:appoff/login_page.dart'; // Import the login_page.dart file
import 'package:firebase_core/firebase_core.dart'; // Import firebase_core
import 'package:appoff/firebase_options.dart'; // Import firebase_options.dart

void main() async { // Make main asynchronous
  WidgetsFlutterBinding.ensureInitialized(); // Required for async operations before runApp
  await Firebase.initializeApp( // Initialize Firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Use routes instead of home for named navigation
      initialRoute: '/', // You can set an initial route
      routes: {
        '/': (context) => LoginPage(), // Define the root route
        '/login': (context) => LoginPage(), // Define the /login route
      },
    );
  }
}
