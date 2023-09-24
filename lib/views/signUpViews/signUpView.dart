import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/views/shared/dialog.dart';


import '../../viewModels/signUpViewModel.dart';
import 'OTP VerificationView.dart';
import '../home/homeView.dart';

class SignUpView extends StatefulWidget {
  static const String routeName = "SignUpView";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool selectedSignIn = false;
  bool selectedSignUp = true;
  var selected = Colors.black;
  var unselected = Colors.black54;
  var viewModel = SignUpWithGoogleViewModel();
  var completeNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpWithGoogleViewModel>(
      create: (_) => viewModel,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocConsumer<SignUpWithGoogleViewModel, SignUpState>(
            builder: (context, state) {
              if (state is ErrorState) {
                return const Center(
                  child: Text("Error occurred while signing up"),
                );
              } else {
                return Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        child: Image.asset("assets/images/img_4.png"),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1,
                        bottom: MediaQuery.of(context).size.height * 0.1,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              border: Border.all(color: Colors.white10),
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "SignUp",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color:
                                               selected
                                              ,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                              height: 3,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 76, 229, 177),
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            )

                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              selectedSignUp
                                  ? Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                          "Sign Up With Phone Number",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.black54,
                                          )),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                          "Sign In With Phone Number",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.black54,
                                          )),
                                    ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              selectedSignUp
                                  ? Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: IntlPhoneField(
                                            dropdownIcon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black54,
                                            ),
                                            cursorColor: Colors.black54,
                                            decoration: const InputDecoration(
                                              focusColor: Colors.black54,
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                color: Colors.black54,
                                              )),
                                              labelText: 'Phone Number',
                                              labelStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w400),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 76, 229, 177)),
                                              ),
                                            ),
                                            initialCountryCode: 'EG',
                                            onChanged: (phone) {
                                              completeNum =
                                                  phone.completeNumber;
                                              print(completeNum);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(PageRouteBuilder(
                                                pageBuilder: (_, __, ___) => OTPVerificationView(
                                                  phone: completeNum,
                                                )));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 55,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              color: const Color.fromARGB(
                                                  255, 76, 229, 177),
                                            ),
                                            child: const Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: const Text(
                                              "By signing up you agree on our terms and conditions",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14)),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            viewModel.signInWithGoogleFun();
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 55,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(18),

                                                  //color:const Color.fromARGB(
                                                  //  255, 38, 114, 203),
                                                  //),
                                                  color: Colors.white),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // ImageIcon(AssetImage("assets/images/img_6.png"),size: 50,),
                                                  Image.network(
                                                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                                                      fit: BoxFit.cover),
                                                  const Text(
                                                    "Sign Up with google",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
            listener: (context, state) {
              if (state is LoadedState) {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              }
              if (state is LoadingState) {
                MyDialogUtils.showLoadingDialog(context, "Loading...");
              }

            },
          )),
    );
  }
}
