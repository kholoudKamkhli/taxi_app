import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/database/user_database.dart';
import '../models/entities/user_model.dart';


class ContactInfoViewModel extends Cubit<ContactInfoState>{
  ContactInfoViewModel() : super(ContactInfoLoading());
  addUserToDatabase(var phone,var email,var username){
    try{
      emit(ContactInfoLoading());
      print("Loading");
      MyUser user = MyUser(id: FirebaseAuth.instance.currentUser!.uid, username: username, email: email, phoneNum: phone);
      UserDatabase.addUserToDatabase(user);
      emit(ContactInfoDone());
      print("Done");
    }catch(e){
      emit(ContactInfoError());
    }
  }
}
class ContactInfoState{}
class ContactInfoLoading extends ContactInfoState{}
class ContactInfoDone extends ContactInfoState{}
class ContactInfoError extends ContactInfoState{}