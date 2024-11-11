import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movies_buzz/services/extensions.dart';
import 'package:movies_buzz/views/screens/auth/otp_screen.dart';

import '../../../controllers/auth_controller.dart';
import '../../../services/input_decoration.dart';
import '../../../services/route_helper.dart';
import '../../../services/theme.dart';
import '../../base/common_button.dart';
import '../../base/custom_image.dart';
import '../../base/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomImage(
                    path: Assets.imagesApplogowithoutbg,
                    height: size.height * .2,
                    width: size.height * .2,
                    color: Colors.black,
                  ),
                ),

                Text(
                  'Welcome to Movies Buzz – Dive into the world of cinema with details on every film, from blockbusters to hidden gems. Your ultimate movie companion awaits!',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),

                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    // controller: Get.find<FirebaseController>().phone,
                    validator: (value) {
                      if (value.isNotValid) {
                        return 'Enter Phone Number';
                      } else if (value?.length != 10) {
                        return 'Enter 10 Digit Phone Number';
                      }
                      return null;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.phone,
                    onTap: () {
                      // setState(() {
                      //   if (Get.find<FirebaseController>().phone.text == 10) {
                      //     _showButton = true;
                      //   } else {
                      //     _showButton = false;
                      //   }
                      // });
                    },
                    onChanged: (value) {
                      setState(() {
                        if (value.length == 10) {
                          _showButton = true;
                        } else {
                          _showButton = false;
                        }
                      });
                    },
                    decoration: CustomDecoration.inputDecoration(
                      prefixWidget: const Text(
                        '+91 | ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      borderRadius: 10,
                      hint: "Enter Number",
                      borderColor: Colors.black87,
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      // suffix: Visibility(
                      //   visible:
                      //       Get.find<FirebaseController>().phone.text.length ==
                      //           10,
                      //   // Adjust the condition based on your requirement
                      //   child: Icon(Icons.check_circle, color: Colors.green),
                      // ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<AuthController>(builder: (authController) {
                  return CustomButton(
                    isLoading: authController.isLoading,
                    elevation: 0,
                    onTap: _showButton
                        ? () async {
                            Navigator.push(context,
                                getCustomRoute(child: const OTPScreen()));

                            // authController.generateOTP(mobile: Get.find<FirebaseController>().phone.text).then((value) {
                            //   if (value.isSuccess) {
                            //     Navigator.push(context, getCustomRoute(child: OtpScreen()));
                            //   } else {
                            //     showSnackBar(context, content: value.message);
                            //   }
                            // });
                          }
                        : null,
                    color: _showButton ? primaryColor : Colors.grey[300],
                    title: "Generate OTP",
                  );
                }),
                const SizedBox(height: 15),
                if (Platform.isAndroid)
                  Center(
                    child: Text(
                      'OR',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                  ),
                if (Platform.isAndroid)
                  const SizedBox(
                    height: 15,
                  ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       boxShadow: [
                //         BoxShadow(
                //           blurRadius: 4,
                //           offset: const Offset(-2, 4),
// color: Colors.black.withOpacity(0.25),
                //         ),
                //       ],
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(
                //     child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Image.asset(
                //           Assets.imagesGoogle,
                //           height: 32,
                //           width: 32,
                //         ),
                //         const SizedBox(width: 15),
                //         Text('Sign in with Google'),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 15),
                if (Platform.isAndroid)
                  Center(
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // Get.find<FirebaseController>().signInWithGoogle(context);
                      },
                      icon: Image.asset(
                        Assets.iconsGoogle,
                        height: 32,
                        width: 32,
                      ),
                      label: const Text('Sign in with Google'),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'I hereby agree and accept the ',
                          style: Theme.of(context).textTheme.labelMedium),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(
                            //   context,
                            //   getCustomRoute(
                            //       child: WebViewScreen(
                            //         link: Get.find().getBusinessSettings?.termsCondition ?? "https://www.appdid.com/",
                            //       )),
                            // );
                          },
                        text: 'Terms & Conditions',
                        style: const TextStyle(
                          color: Colors.red, // Change color to red
                          fontWeight: FontWeight.bold, // Add bold style
                        ),
                      ),
                      TextSpan(
                          text: ' and ',
                          style: Theme.of(context).textTheme.labelMedium),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(
                            //   context,
                            //   getCustomRoute(
                            //       child: WebViewScreen(
                            //         link: Get.find().getBusinessSettings?.privacyPolicy ?? "https://www.appdid.com/",
                            //       )),
                            // );
                          },
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          color: Colors.red, // Change color to red
                          fontWeight: FontWeight.bold, // Add bold style
                        ),
                      ),
                      TextSpan(
                          text: ' in use of the Mobile App.',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
