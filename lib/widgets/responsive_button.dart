import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  ResponsiveButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainTextColor),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? AppText(
                    text: 'Book Trip Now',
                    color: Colors.white,
                  )
                : const Icon(Icons.arrow_forward_ios_sharp)
            //Image.asset("assets/images/welcome-one.png"),
          ],
        ),
      ),
    );
  }
}
