import 'package:ezshare/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EZ',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  'Share',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                // TextButton(
                //   onPressed: () {
                //     Map<String, dynamic> newUser =
                //         LoggedInUser(email: "test@test.com", userID: 123456);
                //     print(newUser);
                //   },
                //   child: Text('Test'),
                // ),
              ],
            ),
            Expanded(
              child: SignInScreen(
                actions: [
                  AuthStateChangeAction<UserCreated>((context, state) {
                    Firestore().addUser(state.credential.user);
                  }),
                  AuthStateChangeAction<SignedIn>((context, state) {
                    Navigator.pushReplacementNamed(context, '/home');
                  })
                ],
                styles: const {
                  EmailFormStyle(),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
