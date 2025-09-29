import 'package:depi_assignment/custom_widgets/avatar_rotate.dart';
import 'package:depi_assignment/screens/login_screen.dart';
import 'package:depi_assignment/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_validator.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class BuildSignUpForm extends StatefulWidget {
  const BuildSignUpForm({super.key});

  @override
  State<BuildSignUpForm> createState() => _BuildSignUpFormState();
}

class _BuildSignUpFormState extends State<BuildSignUpForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fields = [
      {
        'controller': nameController,
        'validationType': ValidationType.name,
        'hint': 'Enter your name',
        'icon': Icons.person,
      },
      {
        'controller': phoneController,
        'validationType': ValidationType.phoneNumber,
        'hint': 'Enter your phone number',
        'icon': Icons.phone,
      },
      {
        'controller': emailController,
        'validationType': ValidationType.email,
        'hint': 'Enter your email',
        'icon': Icons.email,
      },
      {
        'controller': passController,
        'validationType': ValidationType.password,
        'hint': 'Enter your password',
        'icon': Icons.lock,
        'obscure': true,
      },
    ];
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarRotate(),
                SizedBox(height: 50),
                ...fields.map(
                      (f) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CustomTextField(
                      controller: f['controller'],
                      validationType: f['validationType'],
                      hintText: f['hint'],
                      icon: f['icon'],
                      obscureText: f['obscure'] ?? false,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().registerWithEmail(
                        emailController.text,
                        passController.text,
                      );
                    }
                  },
                  buttonText: 'Sign Up',
                  textStyle: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: AppColors.secondaryTextColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.logIn);
                      },
                      child: Text(
                        'Log in',
                        style: Theme.of(context).textTheme.bodyMedium!
                            .copyWith(color: AppColors.secondaryTextColor),
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
