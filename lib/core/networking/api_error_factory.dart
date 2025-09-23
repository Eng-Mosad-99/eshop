import 'package:flutter/material.dart';

import 'api_error_model.dart';
import 'local_status_codes.dart';

class ApiErrorFactory {
  static ApiErrorModel get defaultError => ApiErrorModel(
        message: "Something went wrong",
        statusCode: LocalStatusCodes.defaultError,
        icon: Icons.error,
        errors: [
          'errors occurred!',
        ],
      );
}
