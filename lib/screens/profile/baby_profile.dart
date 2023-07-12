import 'package:baby_cry/screens/profile/components/baby_profile_form.dart';
import 'package:baby_cry/shared/constants.dart';
import 'package:flutter/material.dart';

class BabyProfileScreen extends StatelessWidget {
  const BabyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                Text(
                  "Your baby's Profile",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                const BabyProfileForm(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
