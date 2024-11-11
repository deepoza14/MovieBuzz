import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_buzz/services/extensions.dart';
import 'package:movies_buzz/services/route_helper.dart';
import 'package:movies_buzz/views/screens/dashboard/dashboard_screen.dart';

import '../../../controllers/auth_controller.dart';
import '../../../services/date_formatters_and_converters.dart';
import '../../../services/input_decoration.dart';
import '../../base/common_button.dart';
import '../../base/custom_image.dart';
import '../../base/date_picker_widget.dart';
import '../../base/dialogs/failed_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  String? _selectedGender;
  final List<String> _genders = ['Male', 'Female'];
  int? catId;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Timer.run(() async {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Return false if showDialog() returned null
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sign Up",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: CustomDecoration.inputDecoration(
                          borderColor: Colors.grey.shade800,
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          bgColor: Colors.white,
                          label: "Full Name",
                          hint: "Enter Full Name",
                          suffix: Icon(CupertinoIcons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Full Name';
                        }
                        return null; // Return null if the value is valid
                      },
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      controller: _emailController,
                      decoration: CustomDecoration.inputDecoration(
                          borderColor: Colors.grey.shade800,
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          label: "Email id",
                          hint: "Enter Email Id",
                          suffix: Icon(Icons.email_outlined)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email Id';
                        } else if (value.isNotEmail) {
                          return 'Please Valid Email Id';
                        }
                        return null; // Return null if the value is valid
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedGender,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                      items: _genders.map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Select Gender';
                        }
                        return null; // Return null if the value is valid
                      },
                      decoration: CustomDecoration.inputDecoration(
                          borderColor: Colors.grey.shade800,
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          label: "Gender"),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    CustomDatePicker(
                      onChanged: (DateTime? dateTime) {
                        _birthDateController.text =
                            DateFormatters().yMD.format(dateTime!);
                        setState(() {});
                      },
                      today: false,
                      child: TextFormField(
                        enabled: false,
                        controller: _birthDateController,
                        readOnly: true,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        decoration: CustomDecoration.inputDecoration(
                            label: "Date Of Birth",
                            borderColor: Colors.grey.shade800,
                            hintStyle: Theme.of(context).textTheme.labelLarge,
                            suffix: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(Icons.calendar_month))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select Date Of Birth';
                          }
                          return null; // Return null if the value is valid
                        },
                      ),
                    ),
                    const SizedBox(height: 18),
                    GetBuilder<AuthController>(builder: (authController) {
                      return CustomButton(
                        elevation: 0,
                        isLoading: authController.isLoading,
                        onTap: () {
                          Navigator.push(context,
                              getCustomRoute(child: DashboardScreen()));
                        },
                        title: "PROCEED",
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
