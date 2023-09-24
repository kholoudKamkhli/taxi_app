import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/database/user_database.dart';
import '../models/entities/user_model.dart';

class SignUpWithGoogleViewModel extends Cubit<SignUpState> {
  SignUpWithGoogleViewModel() : super(LoadingState());

  Future<UserCredential?> signInWithGoogle() async {
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    //Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    if (!await UserDatabase.check(
        FirebaseAuth.instance.currentUser?.uid ?? "")) {
      MyUser user = MyUser(
          id: FirebaseAuth.instance.currentUser?.uid ?? "",
          username: FirebaseAuth.instance.currentUser?.displayName ?? "",
          email: FirebaseAuth.instance.currentUser?.email ?? "",
          phoneNum: FirebaseAuth.instance.currentUser?.phoneNumber ?? "");
      UserDatabase.addUserToDatabase(user);
    }
    //Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithGoogleFun() async {
    emit(LoadingState());
    await signInWithGoogle().then((value) {
      emit(LoadedState());
    }).onError((error, stackTrace) {
      emit(ErrorState(error.toString()));
    });
  }
}

abstract class SignUpState {}

class LoadingState extends SignUpState {}

class ErrorState extends SignUpState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class LoadedState extends SignUpState {}
