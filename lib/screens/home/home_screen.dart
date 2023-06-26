import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/welcome/welcome_screen.dart';
import 'package:baby_cry/shared/extentions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "home page",
              style: TextStyle(color: Colors.purple, fontSize: 50),
            ),
            SizedBox(
              height: 250,
            ),
            IconButton(
              onPressed: () async {
                final response = await context.read<UserProvider>().signOut();
                response.fold(
                  (error) => context.showError(error),
                  (result) {
                    if (result is CognitoCompleteSignOut) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                );
              },
              icon: context.watch<UserProvider>().isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Icon(Icons.logout_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
