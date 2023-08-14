// //This is an abstract layer to connect the UI with the repository.

// import 'package:baby_cry/models/BabyProfile.dart';
// import 'package:baby_cry/repositories/baby_repository.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final profileControllerProvider = Provider<ProfileController>((ref) {
//   return ProfileController(ref);
// });

// final profileProvider = StreamProvider.autoDispose<BabyProfile>((ref) {
//   final profcontrollerProvider = ref.watch(profileControllerProvider);
//   return profcontrollerProvider.listenToProfile();
// });

// class ProfileController {
//   ProfileController(this.ref);
//   final Ref ref;

//   Stream<BabyProfile> listenToProfile() {
//     return ref.read(profileRepositoryProvider).listenToProfile();
//   }

//   Future<void> edit(BabyProfile updatedProfile) async {
//     await ref.read(profileRepositoryProvider).update(updatedProfile);
//   }
// }
