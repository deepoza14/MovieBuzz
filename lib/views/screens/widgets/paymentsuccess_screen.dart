import 'package:flutter/material.dart';
import 'package:movies_buzz/services/extensions.dart';
import 'package:movies_buzz/views/screens/dashboard/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../generated/assets.dart';
import '../../../services/route_helper.dart';
import '../../../services/theme.dart';
import '../../base/common_button.dart';
import '../../base/custom_image.dart';
import '../../base/lottie_builder.dart';

class PaymentSuccess extends StatefulWidget {
  final int tabindex;

  const PaymentSuccess({super.key, this.tabindex = 0});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushAndRemoveUntil(
          context,
          getCustomRoute(
            child: const HomeScreen(),
          ),
          (route) => false,
        );
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const CustomLottie(
                  assetLottie: Assets.lottiesSuccess,
                  width: double.infinity,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomLottie(
                      height: size.height * 0.3,
                      assetLottie: Assets.lottiesVerifySuccess,
                      width: double.infinity,
                    ),
                    // Text(
                    //   PriceConverter.convert("25400"),
                    //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    //         fontSize: 26,
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    // ),
                    Text(
                      "Payment done successfully".capitalizeFirstOfEach,
                      style: GoogleFonts.aclonica(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: CustomButton(
                color: primaryColor,
                type: ButtonType.primary,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    getCustomRoute(child: HomeScreen()),
                    (route) => false,
                  );
                },
                child: Text(
                  "View Orders",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        getCustomRoute(child: const HomeScreen()),
                        (route) => false,
                      );
                    },
                    child: CustomImage(
                      path: Assets.iconsHomeOutline,
                      height: 24,
                      width: 24,
                      color: primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      DateTime.now().dateTime,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        getCustomRoute(child: HomeScreen()),
                        (route) => false,
                      );
                    },
                    child: Image.asset(
                      Assets.iconsProfileCircle,
                      height: 24,
                      color: primaryColor,
                      width: 24,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
