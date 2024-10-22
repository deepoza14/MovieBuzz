import 'package:flutter/material.dart';
import '../../../services/theme.dart';
import '../common_button.dart';

class DeleteReqDialogue {
  Future dialogue(context, {Color color = textPrimary, String? titleMsg}) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0), topRight: Radius.circular(0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          width: size.width,
          color: Colors.white,
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 14,
              ),
              Text(
                "Delete $titleMsg",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Do you want sure delete this shipping address",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomButton(
                        color: color,
                        radius: 0,
                        height: 38,
                        type: ButtonType.primary,
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        title: "Delete",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        color: textSecondary,
                        radius: 0,
                        height: 38,
                        type: ButtonType.secondary,
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        title: "Cancel",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        );
      },
    );
  }
}
