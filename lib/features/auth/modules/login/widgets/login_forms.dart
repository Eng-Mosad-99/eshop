import 'package:eshop/features/auth/modules/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common_ui/widgets/app_text_field.dart';
import '../../../common/password_text_field.dart';
import '../../../data/models/login_request_body.dart';

class LoginForms extends StatefulWidget {
  const LoginForms({super.key});

  @override
  State<LoginForms> createState() => _LoginFormsState();
}

class _LoginFormsState extends State<LoginForms> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextField(
            validator: (email) {
              if (email == null || email.isEmpty) {
                return "Please enter your email address";
              }
              return null;
            },
            label: 'Email',
            hintText: "Enter your email address",
            // prefixIcon: ,
            controller: emailController,
          ),

          const SizedBox(height: 20),

          // Password Field
          PasswordTextField(
            passwordController: passwordController,
          ),

          const SizedBox(height: 10),

          // Remember me + Forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (val) {},
                  ),
                  const Text("Remember Me"),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Login button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginCubit>().login(
                        body: LoginRequestBody(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                }
              },
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
