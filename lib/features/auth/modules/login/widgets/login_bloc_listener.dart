import 'package:eshop/core/networking/api_error_model.dart';
import 'package:eshop/features/auth/modules/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is LoginError) {
          AppDialog().showApiError(context, state.error);
        }
      },
    );
  }
}

class AppDialog {
  void showApiError(BuildContext context, ApiErrorModel error) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        actionsPadding: const EdgeInsets.only(right: 8, bottom: 8),
        title: Row(
          children: [
             Text(
              "Error\nStatus Code: ${error.statusCode}",
              style:const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        content: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.grey, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Error Details',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              ...error.errors.map(
                (e) => Text(
                  e,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
// class AppDialog {
//   void showApiError(BuildContext context, ApiErrorModel error) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Row(
//           children: [
//             Icon(
//               Icons.error_outline,
//               color: Colors.red,
//             ),
//             SizedBox(
//               width: 8,
//             ),
//             Text("Error"),
//           ],
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (error?.message != null) ...[
//               Icon(error.icon, color: Colors.red , ),
//               const Text(
//                 'Message:',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 error.message,
//                 style: const TextStyle(
//                   color: Colors.red,
//                 ),
//               ),
//               const SizedBox(height: 5),
//             ],
//             // if (error?.code != null) ...[
//             //   const Text(
//             //     'Error Code: ',
//             //     style: TextStyle(
//             //       color: Colors.red,
//             //       fontWeight: FontWeight.bold,
//             //     ),
//             //   ),
//             //   const SizedBox(height: 5),
//             //   Text(
//             //     error.code,
//             //     style: const TextStyle(
//             //       color: Colors.red,
//             //     ),
//             //   ),
//             //   const SizedBox(height: 5),
//             // ],
//             // if (error?.details != null) ...[
//             //   const Text(
//             //     'Details: ',
//             //     style: TextStyle(
//             //       color: Colors.red,
//             //       fontWeight: FontWeight.bold,
//             //     ),
//             //   ),
//             //   const SizedBox(height: 5),
//             //   Text(
//             //     error.details,
//             //     style: const TextStyle(
//             //       color: Colors.red,
//             //     ),
//             //   ),
//             //   const SizedBox(height: 5),
//             // ],
//           ],
//         ),
//       ),
//     );
//   }
// }
