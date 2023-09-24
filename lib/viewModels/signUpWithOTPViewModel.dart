
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/database/user_database.dart';


class SignUpWithOTPViewModel extends Cubit<OTPState> {
  SignUpWithOTPViewModel() : super(LoadingOTP());
  FirebaseAuth auth = FirebaseAuth.instance;
  var verification;
   signInWithPhone(var phoneNum)async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (PhoneAuthCredential credential)async {
        // await  auth.signInWithCredential(credential);
        //  emit(DoneOTP());
      },
      verificationFailed: (FirebaseAuthException e) {
        // if (e.code == 'invalid-phone-number') {
        //   emit(ErrorOTP("The provided phone number is not valid."));
        // }
        // else{
        //   emit(ErrorOTP("Time Exceeded"));
        // }
      },
      codeSent: (String verificationId, int? resendToken)async {
       verification = verificationId;

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  sentCode(String sms)async{
     try{
       emit(LoadingOTP());
       String smsCode = sms;
       // Create a PhoneAuthCredential with the code
       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verification, smsCode: smsCode);

       // Sign the user in (or link) with the credential
       await auth.signInWithCredential(credential);
       if(!await UserDatabase.check(FirebaseAuth.instance.currentUser?.uid??"")){
         DoneOTP.status = false;
       }
       else{
         DoneOTP.status = true;
       }
       emit(DoneOTP());
     }catch(e){
       emit(ErrorOTP(e.toString()));
     }

  }
}

abstract class OTPState {}
class LoadingOTP extends OTPState {}
class ErrorOTP extends OTPState {
  String errorMessage;
  ErrorOTP(this.errorMessage);
}

class DoneOTP extends OTPState {
  static bool status = false;
}
