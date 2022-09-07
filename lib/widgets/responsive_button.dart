import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/widgets/app_text.dart';

import '../misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final String? text;

  const ResponsiveButton(
      {Key? key, this.text, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive! ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: isResponsive!
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            text != null
                ? Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: AppText(text: text!, color: Colors.white),
                  )
                : const SizedBox.shrink(),
            Image.asset('assets/img/button-one.png')
          ],
        ),
      ),
    );
  }
}
