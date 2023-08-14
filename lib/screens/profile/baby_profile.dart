// import 'package:amplify_api/amplify_api.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:baby_cry/controllers/baby_profile_controller.dart';
// import 'package:baby_cry/models/BabyProfile.dart';
// import 'package:baby_cry/repositories/baby_repository.dart';
// import 'package:baby_cry/screens/home/home_screen.dart';
// import 'package:baby_cry/shared/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:form_field_validator/form_field_validator.dart';

// class BabyProfileScreen extends ConsumerStatefulWidget {
//   const BabyProfileScreen({
//     Key? key,
//     //temp param
//     // required this.babyProfile,
//   }) : super(key: key);

//   //temp param
//   // final BabyProfile? babyProfile;

//   @override
//   ConsumerState<BabyProfileScreen> createState() => _BabyProfileScreenState();
// }

// class _BabyProfileScreenState extends ConsumerState<BabyProfileScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _birthdayController = TextEditingController();
//   final TextEditingController _countryController = TextEditingController();
//   final TextEditingController _zipController = TextEditingController();
//   late String _gender = "girl";

//   // late final String _subtitleText;

//   //temp param
//   // bool get _isCreate => _babyProfile == null;
//   //to
//   // bool get _isCreate => ref.read(profileStreamProvider) == null;

//   //temp param
//   // BabyProfile? get _babyProfile => widget.babyProfile;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   ref.read(profileStreamProvider);

//   //   //temp param
//   //   final babyProfile = _babyProfile;
//   //   if (babyProfile != null) {
//   //     _nameController.text = babyProfile.name;
//   //     _birthdayController.text = babyProfile.birthday.toString();
//   //     _countryController.text = babyProfile.country;
//   //     _zipController.text = babyProfile.zipcode.toString();
//   //     _gender = babyProfile.gender;

//   //     _subtitleText = "";
//   //   } else {
//   //     _subtitleText = "One last step before you continue";
//   //   }
//   // }

//   // @override
//   // void dispose() {
//   //   _nameController.dispose();
//   //   _birthdayController.dispose();
//   //   _countryController.dispose();
//   //   _zipController.dispose();

//   //   super.dispose();
//   // }

//   // Future<void> submitForm() async {
//   //   if (!_formKey.currentState!.validate()) {
//   //     return;
//   //   }

//   //   // If the form is valid, submit the data
//   //   final name = _nameController.text;
//   //   final birthday = TemporalDate.fromString(_birthdayController.text);
//   //   final country = _countryController.text;
//   //   final zipCode = int.parse(_zipController.text);
//   //   final gender = _gender;

//   //   if (_isCreate) {
//   //     // Create a new babyProfile
//   //     final newBabyProfile = BabyProfile(
//   //         name: name,
//   //         birthday: birthday,
//   //         country: country,
//   //         zipcode: zipCode,
//   //         gender: gender);
//   //     final request = ModelMutations.create(newBabyProfile);
//   //     final response = await Amplify.API.mutate(request: request).response;
//   //     safePrint('Create result: $response');
//   //   } else {
//   //     print("!!!!!!! updating profile");
//   //     // Update an existing babyProfile instead
//   //     final updateBabyProfile = _babyProfile!.copyWith(
//   //         //TOCHECK if needed , else remove the id
//   //         // id: _babyProfile!.id,
//   //         name: name,
//   //         birthday: birthday,
//   //         country: country,
//   //         zipcode: zipCode,
//   //         gender: gender);
//   //     final request = ModelMutations.update(updateBabyProfile);
//   //     final response = await Amplify.API.mutate(request: request).response;
//   //     safePrint('Update result: $response');
//   //   }

//   //   // Navigate back to homepage after create/update executes
//   //   if (mounted) {
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //           builder: (context) => HomeScreen(
//   //                 selectedIndex: 1,
//   //               )),
//   //     );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final profileValue = ref.watch(profileProvider);

//     return Scaffold(
//       backgroundColor: kbackground,
//       body: SafeArea(
//         child: LayoutBuilder(builder: (context, constraints) {
//           return Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 SizedBox(height: constraints.maxHeight * 0.05),
//                 Text(
//                   "Your Baby's Profile",
//                   style: Theme.of(context)
//                       .textTheme
//                       .headlineSmall!
//                       .copyWith(fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "ffff",
//                   // _subtitleText,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headlineSmall!
//                       .copyWith(fontWeight: FontWeight.normal),
//                 ),
//                 SizedBox(height: constraints.maxHeight * 0.05),

//                 /////////////////
//                 //placing .when()
//                 /////////////////
//                 profileValue.when(
//                   data: (profile) => Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           //name
//                           Text(
//                             profile.name != null
//                                 ? profile.name!
//                                 : 'Add your name',
//                             style: Theme.of(context).textTheme.titleLarge,
//                           ),
//                           // TextFormField(
//                           //   controller: _nameController,
//                           //   validator:
//                           //       RequiredValidator(errorText: requiredField),
//                           //   textInputAction: TextInputAction.next,
//                           //   decoration: FormInputDecoration.textFieldStyle(
//                           //     labelTextStr: "Baby's nickname",
//                           //   ),
//                           // ),
//                           //birthdate
//                           TextFormField(
//                             controller: _birthdayController,
//                             validator:
//                                 RequiredValidator(errorText: requiredField),
//                             textInputAction: TextInputAction.next,
//                             decoration: FormInputDecoration.textFieldStyle(
//                                 labelTextStr: "Baby's birthdate"),
//                           ),
//                           //country
//                           TextFormField(
//                             controller: _countryController,
//                             validator:
//                                 RequiredValidator(errorText: requiredField),
//                             textInputAction: TextInputAction.next,
//                             decoration: FormInputDecoration.textFieldStyle(
//                                 labelTextStr: "country"),
//                           ),
//                           //zipCode
//                           TextFormField(
//                             controller: _zipController,
//                             validator:
//                                 RequiredValidator(errorText: requiredField),
//                             textInputAction: TextInputAction.next,
//                             decoration: FormInputDecoration.textFieldStyle(
//                                 labelTextStr: "enter zip code"),
//                           ),

//                           // add toggle buttons
//                           //gender
//                           TextField(
//                             // controller: _zipController,
//                             // validator: RequiredValidator(errorText: requiredField),
//                             textInputAction: TextInputAction.next,
//                             decoration: FormInputDecoration.textFieldStyle(
//                                 labelTextStr: "enter gender"),
//                           ),
//                           const SizedBox(height: 20),
//                           ElevatedButton(
//                             onPressed: () {},
//                             child: const Text("save"),
//                           ),
//                           // ElevatedButton(
//                           //   onPressed: submitForm,
//                           //   child: const Text("save"),
//                           // ),
//                         ],
//                       )),
//                   error: (e, st) => Center(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'Error',
//                             style: Theme.of(context).textTheme.titleMedium,
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             textStyle: const TextStyle(fontSize: 20),
//                           ),
//                           onPressed: () async {
//                             ref.refresh(profileProvider);
//                           },
//                           child: const Text('Try again'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   loading: () => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 )
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
