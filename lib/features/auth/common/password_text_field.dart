import 'package:flutter/material.dart';

import '../../../core/common_ui/widgets/app_text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.passwordController});
  final TextEditingController passwordController;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'Password',
      hintText: "Enter your password",
      obscureText: !isPasswordVisible,
      validator: (pass) {
        if (pass == null || pass.isEmpty) {
          return 'Please enter your password';
        } else if (pass.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      suffixIcon: IconButton(
        icon: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
      ),
      controller: widget.passwordController,
    );
  }
}
