import 'package:block_pe/providers/theme_provider.dart';
import 'package:block_pe/utilities/error_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggle();
            },
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDark
                  ? Icons.toggle_on
                  : Icons.toggle_off,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  size: 26,
                ),
                label: Text("Email"),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _password,
              keyboardType: TextInputType.text,
              obscureText: true,
              enableSuggestions: false,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.lock,
                  size: 26,
                ),
                label: Text("Password"),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  await _signin();
                },
                child: const Text("Sign in"),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/signup',
                    (route) => false,
                  );
                },
                child: const Text("Don't have an account? Signup here!"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      if (!context.mounted) return;
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      if (e.code == 'user-not-found') {
        showErrorDialog(
          context,
          "User not found",
          "Sign up to create your account",
        );
      } else if (e.code == 'wrong-password') {
        showErrorDialog(
          context,
          "Wrong password",
          "Enter the right password to sign in",
        );
      } else {
        showErrorDialog(
          context,
          "An exception occurred",
          "Try signing in again",
        );
      }
    } catch (e) {
      showErrorDialog(
        context,
        "An exception occurred",
        "Try signing in again",
      );
    }
  }
}
