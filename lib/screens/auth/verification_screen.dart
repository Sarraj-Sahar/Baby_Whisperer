import 'package:baby_cry/screens/profile/baby_profile.dart';
import 'package:baby_cry/shared/constants.dart';
import 'package:baby_cry/shared/extentions.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import 'components/logo_with_title.dart';
import 'sign_in_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      body: LogoWithTitle(
        title: 'Verification',
        subText: "Verification code has been sent to your mail",
        children: [
          const SizedBox(height: defaultPadding),
          Form(
            key: _formKey,
            child: TextFormField(
              onSaved: (otpCode) {
                _otpCode = otpCode!;
              },
              validator: RequiredValidator(errorText: requiredField),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(hintText: "Enter OTP"),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kprimaryColor)),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final result = await context
                    .read<UserProvider>()
                    .confirmSignUp(username: widget.username, code: _otpCode);
                result.fold(
                  (error) => context.showError(error),
                  (isConfirmed) {
                    if (isConfirmed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("User has been confirmed"),
                          action: SnackBarAction(
                            label: "complete profile",
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),

                                  // const BabyProfileScreen(),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                );
              }
            },
            child: context.watch<UserProvider>().isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text("Validate"),
          ),
        ],
      ),
    );
  }
}
