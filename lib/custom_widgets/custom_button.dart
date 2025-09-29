import 'package:flutter/material.dart';
import '../utils/app_colors.dart';


class CustomButton extends StatelessWidget {
 final  Function() onTap;
 final Color? color;
 final String? buttonText;
 final TextStyle? textStyle;
  const CustomButton({super.key,required this.onTap, this.color,this.buttonText,this.textStyle});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: color??AppColors.mainColor,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Center(child: Text(buttonText??'Login',style: textStyle??theme.textTheme.bodyMedium,),
      ),
    ));
  }
}
