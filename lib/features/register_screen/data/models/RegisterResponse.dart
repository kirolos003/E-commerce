import 'package:e_commerce/features/register_screen/domain/model/User.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"kirolos","email":"kirolos1234@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZGMyZThmYmU4YjUyMzIzNTJmYTg1OSIsIm5hbWUiOiJraXJvbG9zIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MDg5Mjg2NTYsImV4cCI6MTcxNjcwNDY1Nn0.fG_Q7Xz23SqZ6-72MtYkNS3oQJcHMXvgtPlBb5ePv_0"

class RegisterResponse {
  String? message;
  UserDto? user;
  String? token;
  RegisterResponse({
      this.message, 
      this.user, 
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  User? toUser(){
    if(user == null || token == null) return null;
    return User(
      name: user?.name,
      email: user?.email,
      role: user?.role,
      token: token,
    );
  }

}