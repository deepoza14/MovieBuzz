import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';
import '../../../services/theme.dart';

class VerifyDialogue {
  dialogue(context) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SignUpTile(size: size);
      },
    );
  }
}

class SignUpTile extends StatefulWidget {
  const SignUpTile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<SignUpTile> createState() => _SignUpTileState();
}

class _SignUpTileState extends State<SignUpTile> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(25)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            LottieBuilder.asset(
              Assets.lottiesVerifySuccess,
              width: widget.size.width * 0.8,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Verification successful!",
              textAlign: TextAlign.center,
              style: GoogleFonts.aclonica(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Verification email was sent successfully, please check your email to confirm!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
