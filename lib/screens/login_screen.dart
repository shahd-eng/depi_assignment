import 'package:depi_assignment/custom_widgets/custom_text_field.dart';
import 'package:depi_assignment/screens/signup_screen.dart';
import 'package:depi_assignment/utils/app_colors.dart';
import 'package:depi_assignment/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../custom_widgets/custom_button.dart';
import '../utils/app_images.dart';
import '../utils/app_validator.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      appBar: AppBar(
        backgroundColor: Color(0xfffefefe),
        automaticallyImplyLeading: false,
        title: Text(
          'Login',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColors.secondaryTextColor),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushNamed(
              context,
              AppRoutes.home,
            );
          } else if (state is AuthUnAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'login failed')),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.loginImage,
                      width: double.infinity,
                      height: 300,
                    ),
                    SizedBox(height: 64),
                    CustomTextField(
                      controller: emailController,
                      validationType: ValidationType.email,
                      hintText: 'Enter your email',
                      icon: Icons.email,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      controller: passController,
                      validationType: ValidationType.password,
                      hintText: 'Enter your password',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 50),
                    CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signInWithEmail(
                            emailController.text,
                            passController.text,
                          );

                        }
                      },
                      textStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: AppColors.secondaryTextColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signUp);
                          },
                          child: Text(
                            'Sign Up',
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
          );
        },
      ),
    );
  }
}
