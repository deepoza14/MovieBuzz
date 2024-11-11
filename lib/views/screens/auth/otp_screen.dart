import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_buzz/services/route_helper.dart';
import 'package:movies_buzz/services/theme.dart';
import 'package:movies_buzz/views/screens/auth/signup_screen.dart';
import 'package:pinput/pinput.dart';

import '../../../controllers/auth_controller.dart';
import '../../base/common_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor),
      ),
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Text(
              'OTP Code Verification',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            const SizedBox(height: 15),
            const Text(
                'We have sent an OTP to your phone number. Enter the OTP code below to verify.'),
            const SizedBox(height: 30),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              // validator: (value) {
              //   return value == '2222' ? null : 'Pin is incorrect';
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },

              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: primaryColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: primaryColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: primaryColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 15),
            GetBuilder<AuthController>(builder: (authController) {
              return Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                child: CustomButton(
                  elevation: 0,
                  type: ButtonType.primary,
                  isLoading: authController.isLoading,
                  onTap: () async {
                    Navigator.push(
                        context, getCustomRoute(child: SignUpScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Verify Now',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_circle_right,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 15),
            Center(
              child: Text(
                '''Didn't receive code?''',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Resend Code",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: null,
                            )),
                  ),
                  // if (firebaseController.resentOTPTimeLeft != 0)
                  //   Text(
                  //     '${firebaseController.phone.text} in  ${firebaseController.resentOTPTimeLeft} seconds',
                  //   )
                ],
              ),
            ),

            /*    Center(
                child: Visibility(
                  visible: resend,
                  replacement: RichText(
                    text: TextSpan(
                      text: 'Resend Otp : ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Get.find<ThemeController>().darkTheme ? Colors.white : Colors.black87,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: Get.find<FirebaseController>().phone.text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Get.find<ThemeController>().darkTheme ? Colors.white : Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: ' in $_timerSeconds seconds',
                          style: TextStyle(
                            fontSize: 14,
                            color: Get.find<ThemeController>().darkTheme ? Colors.white : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      // Resend the OTP
                      Navigator.pushReplacement(context, getCustomRoute(child: const LoginScreen()));
                    },
                    child: Text(
                      'Resend OTP',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),*/
          ],
        ),
      ),
    );
  }
}
