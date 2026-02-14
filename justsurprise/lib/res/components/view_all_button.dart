import 'package:flutter/material.dart';
import '../colors/app_color.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    super.key,
    this.loading = false,
    required this.title,
    this.height = 30,
    this.width = 80,
    required this.onPress,
    this.textColor = AppColor.whiteColor,
    this.buttonColor = AppColor.lavenderColor
  });

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: loading ?
          const Center(child: CircularProgressIndicator(strokeWidth: 3.0)) :
          Center(child: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColor.whiteColor, fontSize: 13.0, fontFamily: "Kanit")))),
    );
  }
}
