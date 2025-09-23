class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String expiresAtUtc;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      expiresAtUtc: json['expiresAtUtc'] ?? '',
    );
  }


  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'expiresAtUtc': expiresAtUtc,
    'refreshToken': refreshToken,
  };
}