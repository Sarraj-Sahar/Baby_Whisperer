import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_talk/widgets/round_tile.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller = PageController();

  ////////
  bool _loggedIn = false;
  bool _registered = false;

  String _email = "flutterexp@gmail.com";
  String _password = "12345678";
  String _confirmationNumber = "";

  ////

  bool isLastPage = false;
  int kindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Stack(
        // coloumn
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                //2 is our last page starting from 0
                isLastPage = index == 2;
                kindex = index;
              });
            },
            children: [
              //One page layout
              BuildIntroPage(
                img: 'assets/baby_splash_1.jpg',
                description:
                    'We are here to hep you undrestand\n your baby better',
                kcolor: splashLilac,
              ),

              BuildIntroPage(
                img: 'assets/baby_splash_1.jpg',
                description:
                    'We are here to hep you undrestand\n your baby better',
                kcolor: splashPink,
              ),

              BuildIntroPage(
                img: 'assets/baby_splash_1.jpg',
                description:
                    'We are here to hep you undrestand\n your baby better',
                kcolor: splashBlue,
              ),
            ],
          )),
          Container(
            alignment: const Alignment(0, 0.275),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              onDotClicked: (index) {
                _controller.animateToPage(index,
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
          Container(
            alignment: const Alignment(0, 0.425),
            child: const Text(
              "Continue with",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.65),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google
                  RoundTile(
                      imagePath: "assets/Google_Logo.svg",
                      ontap: () {
                        Navigator.pushNamed(context, '/home');
                      }),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                    child: Text(
                      "Or",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
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
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account ?  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                GestureDetector(
                  onTap: () {},
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
      ),
    );
  }

//
////////
  ///
  void _login() async {
    SignInResult res = await Amplify.Auth.signIn(
      username: _email,
      password: _password,
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Logged In successful"),
    ));

    setState(() {
      _loggedIn = res.isSignedIn;
    });
  }

  void _registerAccount() async {
    await Amplify.Auth.signUp(
      username: _email,
      password: _password,
      options: CognitoSignUpOptions(
        userAttributes: {CognitoUserAttributeKey.email: _email},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Registration complete"),
    ));
    setState(() {
      _registered = true;
    });
  }

  _confirmSignUp() async {
    await Amplify.Auth.confirmSignUp(
      username: _email,
      confirmationCode: _confirmationNumber,
    );
    _login();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Confirmation complete"),
    ));
  }
}

class BuildIntroPage extends StatelessWidget {
  String img;
  String description;
  Color kcolor;
  BuildIntroPage({
    super.key,
    required this.description,
    required this.img,
    required this.kcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcolor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 15, right: 15, top: 110, bottom: 70),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180),
              color: Colors.white,
              // image: DecorationImage(
              //   image: AssetImage(img),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
