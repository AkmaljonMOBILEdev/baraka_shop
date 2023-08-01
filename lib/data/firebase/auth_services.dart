import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/universal_data.dart';

class AuthServices {
  Future<UniversalData> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UniversalData(data: userCredential);
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UniversalData(data: userCredential);
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (e) {
      return UniversalData(error: e.toString());

    }
  }

  Future<UniversalData> logOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return UniversalData(data: "User logged out!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return UniversalData(data: userCredential);
    }on FirebaseException catch(e){
      return UniversalData(error: e.code);
    }catch(e){
      return UniversalData(error: e.toString());
    }

  }

  Future<UniversalData> signInWithFacebook()async{
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential credential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return UniversalData(data: userCredential);
    }on FirebaseAuthException catch(e){
      return UniversalData(error: e.code);
    }catch(e){
      return UniversalData(error: e.toString());
    }
  }
}
