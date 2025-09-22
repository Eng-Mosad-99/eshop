import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton(
      {super.key, this.onPressed, required this.title, this.isLoading});
  final void Function()? onPressed;
  final String title;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading == true,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: isLoading == true
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                )
              : Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}

