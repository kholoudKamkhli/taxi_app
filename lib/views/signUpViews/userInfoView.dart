import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/views/shared/dialog.dart';

import '../../viewModels/contactInfoViewModel.dart';
import '../home/homeView.dart';

class ContactInfo extends StatelessWidget {
  static const String routeName = "Contact info";
  late var phone;

  ContactInfo({required this.phone});

  var formKey = GlobalKey<FormState>();
  var fNameCont = TextEditingController();
  var lNameCont = TextEditingController();
  var mailCont = TextEditingController();
  var viewModel = ContactInfoViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactInfoViewModel>(
      create: (_) => viewModel,
      child: Scaffold(
          body: BlocConsumer<ContactInfoViewModel, ContactInfoState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome To Aber!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Please Enter Your Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: fNameCont,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username can't be empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 237, 241, 239),
                        hintText: "Username",
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: mailCont,
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return null;
                      } else {
                        return "Please enter valid Email";
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 237, 241, 239),
                        hintText: "Email",
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print("Clicked cont");
                        viewModel.addUserToDatabase(
                            phone, mailCont.text, fNameCont.text);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color.fromARGB(255, 76, 229, 177),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is ContactInfoDone) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
          if (state is ContactInfoLoading) {
            MyDialogUtils.showLoadingDialog(context, "Loading...");
          }
        },
      )),
    );
  }
}
