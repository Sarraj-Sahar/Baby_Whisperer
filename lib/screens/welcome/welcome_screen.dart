import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/auth/sign_in_screen.dart';
import 'package:baby_cry/screens/auth/sign_up_email_screen.dart';
import 'package:baby_cry/screens/home/home_screen.dart';
import 'package:baby_cry/shared/constants.dart';
import 'package:baby_cry/widgets/round_tile.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'components/build_splash_page.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController controller = PageController();

  bool isLastPage = false;
  int kindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
                kindex = index;
              });
            },
            children: [
              BuildSplashPage(
                img: 'assets/baby_splash_1.jpg',
                description: 'Welcome Back ! ',
                kcolor: splashLilac,
              ),
              BuildSplashPage(
                img: 'assets/baby_splash_1.jpg',
                description:
                    'We are here to hep you undrestand\n your baby better',
                kcolor: splashPink,
              ),
              BuildSplashPage(
                img: 'assets/baby_splash_1.jpg',
                description:
                    'We are here to hep you undrestand\n your baby better',
                kcolor: splashBlue,
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.275),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              onDotClicked: (index) {
                controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              effect: const ExpandingDotsEffect(
                  activeDotColor: splashActiveDot,
                  dotHeight: 7.0,
                  dotWidth: 7.0,
                  dotColor: Colors.black12),
            ),
          ),

          //if user logged in -> don't show "continue with"
          FutureBuilder<AuthUser?>(
            future: context.read<UserProvider>().checkedLogedInUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: const Alignment(0, 1),
                        child: const Text(
                          "Continue with",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //google
                              RoundTile(
                                  imagePath: "assets/Google_Logo.svg",
                                  ontap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpEmailScreen(),
                                      ),
                                    );
                                  }

                                  // ontap: () {
                                  //   Navigator.pushNamed(context, '/home');
                                  // }
                                  ),

                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                                child: Text(
                                  "Or",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                ),
                              ),

                              //mobile
                              RoundTile(
                                  imagePath: "assets/phone.png",
                                  ontap: () {
                                    Navigator.pushNamed(context, '/mobile');
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account ?  ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }
              return Container(
                  alignment: Alignment(0, 0.5),
                  child: const CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
