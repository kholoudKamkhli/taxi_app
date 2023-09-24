import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/views/shared/dialog.dart';
import 'package:taxi_app/views/signUpViews/userInfoView.dart';


import '../../viewModels/signUpWithOTPViewModel.dart';
import '../home/homeView.dart';

class OTPVerificationView extends StatefulWidget {
  static const String routeName = "OTP";
  late var phone;

  OTPVerificationView({required this.phone});

  @override
  State<OTPVerificationView> createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends State<OTPVerificationView> {
  var borderColor = const Color.fromARGB(255, 84, 84, 84);
  var viewModel = SignUpWithOTPViewModel();
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (_) => FocusNode(),
  );

  var controller = TextEditingController();
  var cont1 = TextEditingController();
  var cont2 = TextEditingController();
  var cont3 = TextEditingController();
  var cont4 = TextEditingController();
  var cont5 = TextEditingController();
  var cont6 = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.signInWithPhone(widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    //var completeNum = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider<SignUpWithOTPViewModel>(
      create: (_) => viewModel,
      child: BlocConsumer<SignUpWithOTPViewModel, OTPState>(
        builder: (context, state) {
          if (state is ErrorOTP) {
            return Scaffold(
              body: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Center(
                    child: Text("Something Went Wrong ${state.errorMessage}",style: const TextStyle(fontSize: 20,color: Colors.black54),),),
                ],
              )),
            );
          } else {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 50.0, bottom: 20),
                          child: Text(
                            "Account Verification",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 84, 84, 84),
                            ),
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 5),
                                height: 64,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        _focusNodes[0].nextFocus();
                                      }
                                    },
                                    focusNode: _focusNodes[0],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: cont1,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 5),
                                height: 64,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        _focusNodes[1].nextFocus();
                                      }
                                    },
                                    focusNode: _focusNodes[1],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: cont2,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 64,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        _focusNodes[2].nextFocus();
                                      }
                                    },
                                    focusNode: _focusNodes[2],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: cont3,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 64,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: TextFormField(
                                    focusNode: _focusNodes[3],
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        _focusNodes[3].nextFocus();
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: cont4,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 64,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        _focusNodes[4].nextFocus();
                                      }
                                    },
                                    focusNode: _focusNodes[4],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: cont5,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 64,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        _focusNodes[5].nextFocus();
                                      }
                                    },
                                    focusNode: _focusNodes[5],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        borderColor = Colors.red;
                                        return "";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: cont6,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              var completeCode =
                                  "${cont1.text}${cont2.text}${cont3.text}${cont4.text}${cont5.text}${cont6.text}";
                              viewModel.sentCode(completeCode);
                            } else {
                              borderColor = Colors.red;
                              setState(() {});
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 327,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 18),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 18),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 76, 229, 177),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ));
          }
        },
        listener: (context, state) {
          if(state is ErrorOTP){
            MyDialogUtils.hideDialog(context);
          }
          if (state is DoneOTP) {
            if(DoneOTP.status){
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
            else{
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => ContactInfo(
                    phone: widget.phone,
                  )));
            }
          }
          if (state is LoadingOTP) {
            MyDialogUtils.showLoadingDialog(context, "Verifying Code");
          }
        },
      ),
    );
  }
}
