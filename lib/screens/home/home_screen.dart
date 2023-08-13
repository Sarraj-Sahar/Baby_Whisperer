import 'package:baby_cry/controllers/baby_profile_controller.dart';
import 'package:baby_cry/screens/profile/baby_profile.dart';
import 'package:baby_cry/screens/record/record_cry_screen.dart';
import 'package:baby_cry/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key, required this.selectedIndex});
  int selectedIndex;
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // static get _kprofile => null;
  // late BabyProfile? _bprofile;

  // @override
  // void initState() {
  //   //TEMP2
  //   _bprofile = ref.read(profileProvider.stream.);
  //   super.initState();
  // }

  // void navigateBottomBar(int newIndex) {

  //   setState(() {
  //     widget.selectedIndex = newIndex;
  //   });
  // }

  // final List<Widget> _pages = [
  //   const RecordCryScreen(),
  //   //shouldn't pass null , save babyProfile data
  //   BabyProfileScreen(
  //     //temp1
  //     babyProfile: _bprofile,
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    final profileValue = ref.watch(profileProvider);

    //pages to display
    final List<Widget> _pages = [
      const RecordCryScreen(),
      BabyProfileScreen(
          // babyProfile: profileValue.value,
          )
    ];

    return Scaffold(
      backgroundColor: kbackground,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: GNav(
          selectedIndex: widget.selectedIndex,
          onTabChange: (index) {
            setState(() {
              print(
                  "NAVIGATINGGG BOTTOM bar , babyProfile is : ${ref.read(profileProvider)}");
              widget.selectedIndex = index;
            });
          },
          mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Colors.white,
          gap: 8,
          tabActiveBorder: Border.all(color: Colors.grey),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            ),
          ],
        ),
      ),
      // body: _pages[widget.selectedIndex],
      body: widget.selectedIndex == 0
          ? RecordCryScreen()
          : BabyProfileScreen(
              // babyProfile: profile,
              ),
      // : profileValue.when(
      //     data: (profile) => BabyProfileScreen(
      //         // babyProfile: profile,
      //         ),
      //     error: (e, st) => Center(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Text(
      //               'Error',
      //               style: Theme.of(context).textTheme.titleMedium,
      //               textAlign: TextAlign.center,
      //             ),
      //           ),
      //           TextButton(
      //             style: TextButton.styleFrom(
      //               textStyle: const TextStyle(fontSize: 20),
      //             ),
      //             onPressed: () async {
      //               ref.refresh(profileProvider);
      //             },
      //             child: const Text('Try again'),
      //           ),
      //         ],
      //       ),
      //     ),
      //     loading: () => const Center(
      //       child: CircularProgressIndicator(),
      //     ),
      //   ),
    );
  }
}
