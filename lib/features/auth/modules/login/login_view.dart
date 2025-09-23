import 'package:eshop/core/di/service_locator.dart';
import 'package:eshop/features/auth/modules/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/login_forms.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
              
                  Text(
                    "Hello , Welcome Back 👋",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Happy to see you again , please login here.",
                    style: TextStyle(color: Colors.grey),
                  ),
              
                  SizedBox(height: 30),
              
                  // Email Field
                 LoginForms(),
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
