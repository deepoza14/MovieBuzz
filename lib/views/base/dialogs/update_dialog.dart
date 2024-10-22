import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/auth_controller.dart';
import '../../../generated/assets.dart';
import '../../../services/extra_methods.dart';
import '../../../services/route_helper.dart';
import '../../../services/theme.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({super.key, required this.skip, this.remark = ''});

  final bool skip;
  final String remark;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: IntrinsicHeight(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Image(
                  image: const AssetImage(Assets.imagesPlaceholder),
                  height: size.height * 0.1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Update App",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.aclonica(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  remark,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(fontSize: 12.0, fontWeight: FontWeight.w700, color: Colors.grey[800]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (skip)
                      InkWell(
                        onTap: () {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     getCustomRoute(
                          //       child: const DashboardScreen(),
                          //     ),
                          //     (route) => false);
                        },
                        child: Container(
                          height: 40,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'Later',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (skip)
                      const SizedBox(
                        width: 10,
                      ),
                    InkWell(
                      onTap: () async {
                        if (GetPlatform.isAndroid) {
                          //TODO: CHANGE ANDROID LINK
                          ExtraMethods.launchWebsite("https://play.google.com/store/apps/");
                        } else {
                          //TODO: CHANGE IOS LINK
                          ExtraMethods.launchWebsite("https://apps.apple.com/");
                        }
                      },
                      child: Container(
                        height: 40,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            'Update Now',
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
      ),
    );
  }
}
