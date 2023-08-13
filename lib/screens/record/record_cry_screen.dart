import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/welcome/welcome_screen.dart';
import 'package:baby_cry/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import 'components/play_button.dart';

class RecordCryScreen extends ConsumerStatefulWidget {
  const RecordCryScreen({super.key});

  @override
  ConsumerState<RecordCryScreen> createState() => _RecordCryScreenState();
}

class _RecordCryScreenState extends ConsumerState<RecordCryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayButton(
          pauseIcon: Icon(Icons.mic, color: Colors.grey, size: 70),
          playIcon: Icon(Icons.mic, color: Colors.black, size: 70),
          onPressed: () {},
        ),

        // /
        // /
        Align(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: IconButton(
                  onPressed: () async {
                    final response = await ref.read(userProvider).signOut();
                    response.fold(
                      (error) => context.showError(error),
                      (result) {
                        if (result is CognitoCompleteSignOut) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomeScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                    );
                  },
                  icon: ref.watch(userProvider).isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Icon(Icons.logout_outlined),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
