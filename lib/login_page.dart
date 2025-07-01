import 'package:flutter/material.dart';
// Import the HomePage widget
import 'package:appoff/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Make LoginPage a StatefulWidget to handle state changes for Google Sign-In
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create instances of FirebaseAuth and GoogleSignIn
  final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();



  Future<void> _signInWithGoogle() async {
    try {
      // Sign in with Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in process
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential for Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // On successful sign-in, navigate to the HomePage
        Navigator.pushReplacement( // Use pushReplacement to prevent going back to login
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } catch (e) {
      // Handle errors (e.g., print to console, show a snackbar)
      print('Error during Google sign-in: $e');
      // You might want to show a user-friendly error message here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Esta es la página de Login',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20), // Add some spacing
            ElevatedButton.icon(
              icon: Image.asset( // Use an image asset for the Google icon
                'assets/images/google_logo.png', // You'll need to add a Google logo image to your assets
                height: 20.0,
              ),
              label: Text('Sign in with Google'),
              onPressed: () {
                // Call the asynchronous sign-in function
                _signInWithGoogle(); 
              },
            ),
          ],
        ),
      ),
    );
  }
}


