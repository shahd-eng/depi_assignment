
import 'package:depi_assignment/custom_widgets/build_sign_up_form.dart';
import 'package:depi_assignment/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      appBar: AppBar(
        backgroundColor: Color(0xfffefefe),
        automaticallyImplyLeading: false,
        title: Text(
          'Create Account',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColors.secondaryTextColor),
        ),
        centerTitle: true,
      ),
      body:BlocListener
      <AuthCubit, AuthState>(
          listener: (context,state)
              {
                if(state is AuthAuthenticated)
                  {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                else if (state is AuthUnAuthenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message ?? 'sign up failed')),
                  );
                }
              },
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(child: CircularProgressIndicator());
      }
          return BuildSignUpForm();
        },

      ),


  ),
  );



  }
}
