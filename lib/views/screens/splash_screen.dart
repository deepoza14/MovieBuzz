import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_buzz/views/screens/dashboard/dashboard_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../data/repositories/auth_repo.dart';
import '../../services/route_helper.dart';
import '../base/custom_image.dart';
import '../base/dialogs/maintenance_dialog.dart';
import '../base/dialogs/update_dialog.dart';
import 'dashboard/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      Navigator.pushAndRemoveUntil(
        context,
        getCustomRoute(child: DashboardScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
