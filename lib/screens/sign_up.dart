import 'package:block_pe/providers/theme_provider.dart';
import 'package:block_pe/utilities/error_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
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
              controller: _username,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.person,
                  size: 26,
                ),
                label: Text("Username"),
              ),
            ),
            const SizedBox(height: 15),
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
                  await _signup();
                },
                child: const Text("Sign up"),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/signin',
                    (route) => false,
                  );
                },
                child: const Text("Already have an account? Login here!"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signup() async {
    try {
      UserCredential userCred =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCred.user?.uid)
          .set(
        {
          'username': _username.text,
          'email': _email.text,
        },
      );
      if (!context.mounted) return;
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/phoneverify',
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showErrorDialog(
          context,
          "Invalid email",
          "Enter a valid email address",
        );
      } else if (e.code == 'weak-password') {
        showErrorDialog(
          context,
          "Weak password",
          "Enter a password with more than 6 characters",
        );
      } else if (e.code == 'email-already-in-use') {
        showErrorDialog(
          context,
          "Email already in use",
          "Proceed to sign in using this email",
        );
      } else {
        showErrorDialog(
          context,
          "An exception occurred",
          "Try signing up again",
        );
      }
    } catch (e) {
      showErrorDialog(
        context,
        "An exception occurred",
        "Try signing up again",
      );
    }
  }
}
