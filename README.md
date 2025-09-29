# depi_assignment

This is a new flutter project that displays a popular characters
The project include a welcom,login,sigup screens with firebase authentication and animation when navigating to home screen that displayes the popular charachters

## Features
Fetch data from API using Dio.
State management with Bloc(cubit).
Centralized **routes manager** for easy navigation.
Simple navigation packages like **Flutter Staggered Animations package** ,**RotationTransition Widget**.
**login,signup** screens.
Upload user image when signup.
Clean structure.


## Structure
lib/
│
├── cubits/
│ ├── person_cubit/
│ │ ├── person_cubit.dart
│ │ └── person_state.dart
│ │
│ └── auth_cubit/
│ ├── auth_cubit.dart
│ └── auth_state.dart
│
├── models/
│ └── person.dart
│
├── services/
│ ├── firebase_services/
│ └── web_services/
│ └── person_repository.dart
│
├── screens/
│ ├── home_screen.dart
│ ├── login_screen.dart
│ ├── signup_screen.dart
│ └── welcome.dart
│
├── custom_widgets/
│ ├── avatar_rotate.dart
│ ├── build_sign_up_form.dart
│ ├── custom_button.dart
│ └── custom_text_form_field.dart
│
├── utils/
│ ├── app_routes.dart
│ ├── app_colors.dart
│ ├── app_fonts.dart
│ ├── app_images.dart
│ └── app_validator.dart
│
├── firebase_options.dart
└── main.dart
