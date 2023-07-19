import 'package:baby_cry/models/BabyProfile.dart';
import 'package:baby_cry/providers/baby_profile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//reading the latest data from profileDataStoreServiceProvider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  ProfileDataStoreService profileDatastoreService =
      ref.read(profileDataStoreServiceProvider);
  return ProfileRepository(profileDatastoreService);
});

//listening / watching the profileRepositoryProvider for any changes
final profileStreamProvider = StreamProvider.autoDispose<BabyProfile>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  return profileRepository.listenToProfile();
});

class ProfileRepository {
  ProfileRepository(this.profileDatastoreService);
  final ProfileDataStoreService profileDatastoreService;

  // stream to listen to any profile changes
  Stream<BabyProfile> listenToProfile() {
    return profileDatastoreService.listenToProfile();
  }

  //void to update the profile
  Future<void> update(BabyProfile updatedProfile) async {
    await profileDatastoreService.updateProfile(updatedProfile);
  }

  //Adding / creating the profile
  add(BabyProfile profile) async {
    await profileDatastoreService.addProfile(profile);
  }
}
