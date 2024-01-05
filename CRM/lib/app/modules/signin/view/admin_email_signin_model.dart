class adminLogin {
  String? message;
  String? accessToken;
  String? tokenType;
  String? email;

  adminLogin({this.message, this.accessToken, this.tokenType, this.email});

  adminLogin.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['email'] = this.email;
    return data;
  }
}
