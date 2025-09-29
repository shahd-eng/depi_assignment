import 'package:depi_assignment/cubits/person_cubit/person_cubit.dart';
import 'package:depi_assignment/services/firebase_services/auth_repo.dart';
import 'package:depi_assignment/utils/app_fonts.dart';
import 'package:depi_assignment/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit/auth_cubit.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AuthRepository()),
        ),
        BlocProvider(
          create: (_) => PersonCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontFamily: AppFonts.boldItalic,
              fontSize: FontSizes.largeFont,
              fontWeight: FontWeights.largeWeight,
              color: FontColors.largeFontColor,

            ),
            bodyMedium: TextStyle(
              fontFamily: AppFonts.italic,
              fontSize: FontSizes.mediumFont,
              fontWeight: FontWeights.medWeight,
              color: FontColors.mediumFontColor,
            ),
          ),

        ),
        initialRoute: AppRoutes.welcome,
      routes: AppRoutes.routes,
      ),
    );
  }
}


