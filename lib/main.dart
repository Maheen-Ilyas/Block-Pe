import 'package:block_pe/firebase_options.dart';
import 'package:block_pe/screens/home_page.dart';
import 'package:block_pe/screens/number_input.dart';
import 'package:block_pe/screens/sign_in.dart';
import 'package:block_pe/screens/sign_up.dart';
import 'package:block_pe/providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => const HomePage(),
        '/phoneverify': (context) => const NumberInput(),
      },
      theme: Provider.of<ThemeProvider>(context).theme,
      home: const SignUp(),
    );
  }
}
