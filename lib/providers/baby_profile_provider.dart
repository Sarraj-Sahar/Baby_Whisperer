// //The layer to connect with the Amplify backend.

// // Creating a profileDataStoreServiceProvider which will contain the
// // listenToProfile() and updateProfile() functions

// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:baby_cry/models/BabyProfile.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final profileDataStoreServiceProvider =
//     Provider<ProfileDataStoreService>((ref) {
//   return ProfileDataStoreService();
// });

// class ProfileDataStoreService {
//   ProfileDataStoreService();

//   //Listening to any changes in BabyProfile using Amplify's DataStore
//   //This function will query the Amplify DataStore for the babyProfile
//   Stream<BabyProfile> listenToProfile() {
//     return Amplify.DataStore.observeQuery(
//       BabyProfile.classType,
//     ).map((event) => event.items.first).handleError(
//       (dynamic error) {
//         debugPrint(
//             'listenToProfile: A Stream error happened \n //////// $error');
//       },
//     );
//   }

//   //Updating the BabyProfile
//   Future<void> updateProfile(BabyProfile updatedProfile) async {
//     try {
//       final profileWithId = await Amplify.DataStore.query(
//         BabyProfile.classType,
//         where: BabyProfile.ID.eq(updatedProfile.id),
//       );

//       final oldProfile = profileWithId.first;
//       final newProfile = oldProfile.copyWith(
//         name: updatedProfile.name,
//         birthday: updatedProfile.birthday,
//         country: updatedProfile.country,
//         zipcode: updatedProfile.zipcode,
//         gender: updatedProfile.gender,
//       );

//       await Amplify.DataStore.save(newProfile);
//     } on Exception catch (error) {
//       debugPrint(error.toString());
//     }
//   }

//   //Adding / Creating the babyProfile on a user's signUp
//   Future<void> addProfile(BabyProfile profile) async {
//     try {
//       await Amplify.DataStore.save(profile);
//     } on Exception catch (error) {
//       debugPrint(error.toString());
//     }
//   }
// }
