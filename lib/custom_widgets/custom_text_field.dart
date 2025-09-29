import 'package:depi_assignment/utils/app_validator.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValidationType validationType;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({super.key, required this.controller, required this.validationType, required this.hintText, required this.icon,this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (input) {
        return AppValidator.appValidator(
          input:input??'',
          type:validationType,
        );
      },
      keyboardType:validationType==ValidationType.email? TextInputType.emailAddress:TextInputType.text,
      obscureText: obscureText,

      decoration: InputDecoration(
        hintText:hintText,
        hintStyle: theme.textTheme.bodySmall,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
