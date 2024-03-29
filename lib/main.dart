import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:productivity_app/screens/HomePage.dart';
import 'package:productivity_app/screens/SignIn.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)=>
        snapshot.hasData? HomePage() : SignInPage(),
      ),

    );
  }
}