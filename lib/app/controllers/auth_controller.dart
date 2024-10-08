import 'package:chatapp/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });

    await skipIntro().then((value) {
      isSkipIntro.value = value;
    });
  }

  Future<bool> skipIntro() async {
    final box = GetStorage();
    if (box.read("skipIntro") != null || box.read("skipIntro") == true) {
      return true;
    }
    return false;
  }

  Future<bool> autoLogin() async {
    try {
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  Future<void> login() async {
    // Get.offAllNamed(Routes.HOME);
    try {
      await _googleSignIn.signOut();

      await _googleSignIn.signIn().then((value) => _currentUser = value);

      final isSignin = await _googleSignIn.isSignedIn();

      if (isSignin) {
        print("Signed In");
        print(_currentUser);

        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("User Credential");
        print(userCredential);

        final box = GetStorage();
        if (box.read("skipIntro") != null) {
          box.remove("skipIntro");
        }
        box.write("skipIntro", true);

        CollectionReference users = firestore.collection('users');
        final checkuser = await users.doc(_currentUser!.email).get();

        if (checkuser.data() == null) {
          await users.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentUser!.displayName,
            "keyName": _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            "email": _currentUser!.email,
            "photoUrl": _currentUser!.photoUrl ?? "noimage",
            "status": "",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
          });

          await users.doc(_currentUser!.email).collection("chats");
        } else {
          await users.doc(_currentUser!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        print("Not Signed In");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
