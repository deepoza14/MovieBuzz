import 'package:flutter/material.dart';
import 'package:movies_buzz/services/extensions.dart';

import '../common_button.dart';
import '../custom_image.dart';

class RequestPermissionDialog extends StatelessWidget {
  const RequestPermissionDialog({super.key, required this.permission, this.extraMessage});

  final String permission;
  final String? extraMessage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImage(
              path: Assets.imagesPlaceholder,
              height: size.height * .07,
              width: size.width * .5,
            ),
            const SizedBox(height: 14.0),
            Text(
              'Requires access to your $permission to perform this action.',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
              textAlign: TextAlign.center,
            ),
            if (extraMessage.isValid)
              Text(
                extraMessage!,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 14.0),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    type: ButtonType.secondary,
                    onTap: () => Navigator.pop(context, false),
                    title: 'Reject',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    type: ButtonType.primary,
                    color: Colors.black,
                    onTap: () => Navigator.pop(context, true),
                    title: 'Accept',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
