import 'package:baby_cry/shared/constants.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _MobileSignUpState();
}

class _MobileSignUpState extends State<PhoneNumberScreen> {
  TextEditingController countryController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 6),
          child: Column(
            children: [
              //text sign up
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Sign up with mobile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                ],
              ),

              //help text
              const Padding(
                padding: EdgeInsets.only(left: 60.0, top: 20, bottom: 40),
                child: Text(
                  "Please specify your phone number and country",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),

              //input phone number field
              Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(253, 253, 253, 253),
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      controller: numberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),

              //confirm button
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: splashActiveDot,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text("Continue")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
