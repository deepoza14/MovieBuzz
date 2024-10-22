import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';

class MaintenanceDialog extends StatelessWidget {
  const MaintenanceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                Assets.lottiesMaintenance,
                height: size.height * 0.5,
                width: size.height * 0.5,
              ),
              Text(
                "Under Maintenance",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[900]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Temporarily Unavailable, We're Enhancing Your Experience",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      SystemNavigator.pop();
                    },
                    child: Container(
                      height: 40,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          'Close App',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
