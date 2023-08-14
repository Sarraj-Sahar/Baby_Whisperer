import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:baby_cry/baby_profile/controller/baby_controller.dart';
import 'package:baby_cry/models/ModelProvider.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/welcome/welcome_screen.dart';
import 'package:baby_cry/shared/utils/constants.dart';
import 'package:baby_cry/shared/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'edit_baby_profile_sheet.dart';

class BabyProfilePage extends ConsumerWidget {
  const BabyProfilePage({
    super.key,
  });

  void editProfile(BuildContext context, BabyProfile profile) async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (BuildContext context) {
        return EditProfileBottomSheet(
          profile: profile,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileValue = ref.watch(profileProvider);
    return Scaffold(
        backgroundColor: kbackground,
        body: profileValue.when(
          data: (profile) => Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: ListView(
              children: [
                SizedBox(height: 50),
                Text(
                  "Your Baby's Profile",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                Text(
                  profile.name != null ? profile.name! : 'Add  name',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Divider(color: Colors.black),
                ),

                SizedBox(height: 50),
                Text(
                  profile.name != null ? profile.country! : 'Add  country',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Divider(color: Colors.black),
                ),

//

                SizedBox(height: 50),
                Text(
                  profile.birthday != null
                      ? profile.birthday.toString()!
                      : 'Add birthday',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Divider(color: Colors.black),
                ),

                SizedBox(height: 50),
                Text(
                  profile.zipcode != null
                      ? profile.zipcode.toString()!
                      : 'Add zipcode',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Divider(color: Colors.black),
                ),
//

                SizedBox(height: 50),
                Text(
                  profile.gender != null ? profile.gender! : 'Add gender',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Divider(color: Colors.black),
                ),
                //
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    editProfile(context, profile);
                  },
                  child: const Text('Edit'),
                ),

                //
                // /
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: IconButton(
                          onPressed: () async {
                            final response =
                                await ref.read(userProvider).signOut();
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
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Icon(Icons.logout_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          error: (e, st) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Error',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    ref.refresh(profileProvider);
                  },
                  child: const Text('Try again'),
                ),
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
